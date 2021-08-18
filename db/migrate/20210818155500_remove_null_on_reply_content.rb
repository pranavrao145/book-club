class RemoveNullOnReplyContent < ActiveRecord::Migration[6.1]
  def change
    change_column_null :replies, :content, false
  end
end
