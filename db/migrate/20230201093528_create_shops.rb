class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :title
      t.string :address
      t.string :phone
      t.string :tax_number
      t.datetime :start_at
      t.datetime :end_at
      t.string :tag

      t.timestamps
    end
  end
end
