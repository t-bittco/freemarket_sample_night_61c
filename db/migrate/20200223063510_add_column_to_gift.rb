class AddColumnToGift < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :shipping_charge, :string    
    add_column :gifts, :how_to_ship, :string
    add_column :gifts, :sender_region, :string
    add_column :gifts, :days_to_ship, :string
    add_column :gifts, :gift_id, :integer
    add_column :gifts, :category_id, :integer
  end
end
