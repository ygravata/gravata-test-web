class CreateCompanyPartialSales < ActiveRecord::Migration[6.0]
  def change
    create_table :company_partial_sales do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
