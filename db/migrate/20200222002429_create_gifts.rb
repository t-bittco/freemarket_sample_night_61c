class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :name, null: false
      t.text :discription, null: false
      t.text :category, null: false
      t.text :state, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
