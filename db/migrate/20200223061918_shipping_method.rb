class ShippingMethod < ActiveRecord::Migration[5.2]
  def change
    drop_table :shipping_methods
  end
end
