class AddUserToStarterAndReply < ActiveRecord::Migration[6.1]
  def change
    add_reference :starters, :author
    add_reference :replies, :author

    add_foreign_key :starters, :users, column: :author_id
    add_foreign_key :replies, :users, column: :author_id
  end
end
