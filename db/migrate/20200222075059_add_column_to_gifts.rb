class AddColumnToGifts < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :child_category, :string
    add_column :gifts, :grand_category, :string 
  end
end
