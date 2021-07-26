class ChangeReviewsContentToText < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :content
    add_column :reviews, :content, :text
  end
end
