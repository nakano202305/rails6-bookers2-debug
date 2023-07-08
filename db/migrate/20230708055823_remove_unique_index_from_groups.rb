class RemoveUniqueIndexFromGroups < ActiveRecord::Migration[6.1]
  def change
    remove_index :groups, name: "index_groups_on_user_id_and_book_id"
  end
end
