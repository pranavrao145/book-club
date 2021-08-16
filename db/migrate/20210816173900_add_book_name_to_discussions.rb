class AddBookNameToDiscussions < ActiveRecord::Migration[6.1]
  def change
    add_column :discussions, :book_name, :string
  end
end
