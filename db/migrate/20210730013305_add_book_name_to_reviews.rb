class AddBookNameToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :book_name, :string
  end
end
