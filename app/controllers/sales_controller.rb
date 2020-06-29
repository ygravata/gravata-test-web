class SalesController < ApplicationController
  def destroy
    @sale = Sale.find(params[:id])
    authorize @sale
    @sale.destroy
    redirect_to company_partial_sales_path
  end
end
