class ChageCloumnNameToShop < ActiveRecord::Migration[6.1]
  def change
    rename_column :shops, :type, :tag
  end
end
