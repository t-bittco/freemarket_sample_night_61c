class RemoveTelephoneFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :telephone, :integer
  end
end
