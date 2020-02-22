class CreateShippingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_methods do |t|
      t.integer :gift_id, null: false
      t.string :shipping_charge, null: false
      t.string :how_to_ship, null: false
      t.string :sender_region, null: false
      t.string :days_to_ship, null: false
      t.timestamps
    end
  end
end
