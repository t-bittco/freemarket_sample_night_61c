class AddUserIdToGifts < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :user_id, :integer
  end
end
