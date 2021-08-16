class AddUserToDiscussion < ActiveRecord::Migration[6.1]
  def change
    add_reference :discussions, :author

    add_foreign_key :discussions, :users, column: :author_id
  end
end
