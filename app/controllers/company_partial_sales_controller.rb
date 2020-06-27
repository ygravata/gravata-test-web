class CompanyPartialSalesController < ApplicationController
    def index
        @company_partial_sales = CompanyPartialSale.all
        @all = Sale.all
        
        @total = 0

        @all.each do |sale|
            @total += sale.total_income
        end
        @total
    end
    
end
