class RemoveNullOnVariousThings < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reviews, :gbook_id, false
    change_column_null :discussions, :gbook_id, false
    change_column_null :discussions, :title, false
    change_column_null :discussions, :content, false
    change_column_null :discussions, :book_name, false
  end
end
