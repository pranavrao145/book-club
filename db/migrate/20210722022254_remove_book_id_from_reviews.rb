class RemoveBookIdFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :book_id
  end
end
