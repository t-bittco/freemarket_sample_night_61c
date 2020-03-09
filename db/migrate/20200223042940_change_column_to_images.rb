class ChangeColumnToImages < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :images, :gift_id, :integer, foreign_key: true
    end
    def down
      change_column :images, :gift_id, :integer
    end
  end
end
