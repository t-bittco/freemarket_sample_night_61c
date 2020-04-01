class ChangeColumnname < ActiveRecord::Migration[5.2]
  def change
      add_column :gifts, :status_id, :integer, null: false
      remove_column :gifts, :state, :string
      add_column :gifts, :charge_id, :integer, null: false
      remove_column :gifts, :shipping_charge, :string
      add_column :gifts, :how_to_ship_id, :integer, null: false
      remove_column :gifts, :how_to_ship, :string
      add_column :gifts, :days_id, :integer, null: false
      remove_column :gifts, :days_to_ship, :string
      add_column :gifts, :region_id, :integer, null: false
      remove_column :gifts, :sender_region, :string
  end
end
