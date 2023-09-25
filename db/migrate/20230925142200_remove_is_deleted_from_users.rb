class RemoveIsDeletedFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :is_dereted, :boolean
  end
end
