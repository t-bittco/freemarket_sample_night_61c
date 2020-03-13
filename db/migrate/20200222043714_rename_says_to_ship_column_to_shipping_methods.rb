class RenameSaysToShipColumnToShippingMethods < ActiveRecord::Migration[5.2]
  def change
    rename_column :shipping_methods, :says_to_ship, :days_to_ship
  end
end
