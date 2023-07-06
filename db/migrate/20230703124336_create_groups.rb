class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :introduction
      t.integer :user_id
      t.integer :book_id
      t.integer :status, default: 0, null: false
      
      t.index [:user_id, :book_id], unique: true
      t.timestamps
    end
  end
end
