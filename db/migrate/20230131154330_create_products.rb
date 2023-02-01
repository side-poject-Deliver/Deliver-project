class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :price
      t.string :product_name
      t.integer :quantity
      t.datetime :delete_at
      t.text :note

      t.timestamps
    end
  end
end
