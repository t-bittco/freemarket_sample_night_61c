class ChangeColumnGifts < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :gifts, :listing_state, :integer
    end
    def down
      change_column :gifts, :listing_state, :string
    end

  end
end
