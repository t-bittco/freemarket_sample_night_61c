class AddColumnToGifttable < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :brand_id, :integer, foreign_key: true
  end
end
