class AddUserIdToPublications < ActiveRecord::Migration[5.1]
  def change
    add_column :publications, :user_id, :integer
    add_index :publications, :user_id
  end
end
