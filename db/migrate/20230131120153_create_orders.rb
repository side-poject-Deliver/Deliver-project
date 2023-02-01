class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :price
      t.integer :quantity
      t.string :serial
      t.text :remark
      t.string :product_name
      t.string :shop

      t.timestamps
    end
  end
end
