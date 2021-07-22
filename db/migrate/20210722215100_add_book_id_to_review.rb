class AddBookIdToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :gbook_id, :string
  end
end
