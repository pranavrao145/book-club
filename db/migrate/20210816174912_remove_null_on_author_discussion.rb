class RemoveNullOnAuthorDiscussion < ActiveRecord::Migration[6.1]
  def change
    change_column_null :discussions, :author_id, false
  end
end
