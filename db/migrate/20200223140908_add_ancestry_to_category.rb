class AddAncestryToCategory < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :ancestry
  end
  def up
    change_column :categories, :ancestry, :string
  end
  def down
    change_column :categories, :ancestry, :string, null: false
  end
end
