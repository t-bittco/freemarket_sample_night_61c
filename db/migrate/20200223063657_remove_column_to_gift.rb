class RemoveColumnToGift < ActiveRecord::Migration[5.2]
  def change
    remove_column :gifts, :category, :string
    remove_column :gifts, :child_category, :string
    remove_column :gifts, :grand_category, :string  
  end
end
