class AddRefer < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :shop, foreign_key: true
  end
end
