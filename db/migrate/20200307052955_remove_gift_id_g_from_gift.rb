class RemoveGiftIdGFromGift < ActiveRecord::Migration[5.2]
  def change
    remove_column :gifts, :gift_id, :integer
  end
end
