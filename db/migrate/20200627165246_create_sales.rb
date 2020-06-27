class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string :purchase_name
      t.text :item_description
      t.integer :item_price
      t.integer :purchase_count
      t.text :merchant_address
      t.string :merchant_name
      t.references :company_partial_sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
