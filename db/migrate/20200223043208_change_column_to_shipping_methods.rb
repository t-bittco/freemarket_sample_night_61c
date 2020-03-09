class ChangeColumnToShippingMethods < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :shipping_methods, :gift_id, :integer, foreign_key: true
    end
    def down
      change_column :shipping_methods, :gift_id, :integer
    end
  end
end
