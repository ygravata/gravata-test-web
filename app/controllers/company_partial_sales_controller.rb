class CompanyPartialSalesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  require 'csv'

  def index
    @company_partial_sale = CompanyPartialSale.new
    @company_partial_sales = CompanyPartialSale.all.order(created_at: :desc)

    @sales = Sale.all  
    @total_gross_income = 0
    @sales.each do |sale|
        @total_gross_income += sale.total_income
    end

    @user_last_input_total = 0
    @user_last_input = current_user.company_partial_sales.last
    unless @user_last_input.nil?
      @user_last_input.sales.each do |sale|
        @user_last_input_total += sale.total_income
      end
    end
  end

  def new
    @company_partial_sale = CompanyPartialSale.new      
    authorize @company_partial_sale
  end
  
  def create
    @company_partial_sale = CompanyPartialSale.new
    @company_partial_sale.user = current_user
    authorize @company_partial_sale

    if @company_partial_sale.save!
      if params[:company_partial_sale][:dataset]

        csv_options = { col_sep: "\t", quote_char: '"', headers: :first_row }
        filepath = params[:company_partial_sale][:dataset]
               
        CSV.foreach(filepath, csv_options) do |row|
          new_sale = Sale.new(purchase_name: row[0].to_s, item_description: row[1].to_s, item_price: row[2].to_i, purchase_count: row[3].to_i, merchant_address: row[4].to_s, merchant_name: row[5].to_s)
          new_sale.company_partial_sale_id = @company_partial_sale.id
          authorize new_sale
          new_sale.save!                  
        end
      end
      redirect_to company_partial_sales_path, notice: "Upload sucessfull realized!"
    else
      render :new, notice: "Please, try again."
    end 
  end

  def destroy
    @user_last_input = current_user.company_partial_sales.last
    authorize @user_last_input
    @user_last_input.destroy
    redirect_to company_partial_sales_path
  end


	private

	def company_partial_sale_params
		params.require(:company_partial_sale).permit(:dataset)
	end 
end
