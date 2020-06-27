class Sale < ApplicationRecord
  belongs_to :company_partial_sale

  def total_income
    item_price * purchase_count
  end
end
