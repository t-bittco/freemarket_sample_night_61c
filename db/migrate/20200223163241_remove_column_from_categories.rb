class RemoveColumnFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :path, :integer, null: false
  end
end
