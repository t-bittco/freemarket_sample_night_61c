class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :gift_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
