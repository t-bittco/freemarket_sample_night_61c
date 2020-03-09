class AddBuyerIdToGifts < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :buyer_id, :integer
    add_column :gifts, :listing_state, :string
  end
end
