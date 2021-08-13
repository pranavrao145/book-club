class RemoveNullOnUserUsername < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :username, false
  end
end
