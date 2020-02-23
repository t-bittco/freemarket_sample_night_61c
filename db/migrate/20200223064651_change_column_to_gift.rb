class ChangeColumnToGift < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :gifts, :image_id, :integer, foreign_key: true
    end
    def down
      change_column :gifts, :gift_id, :integer
    end
  end
end
