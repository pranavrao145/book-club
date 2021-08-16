class AddTitleAndContentToDiscussions < ActiveRecord::Migration[6.1]
  def change
    add_column :discussions, :title, :string
    add_column :discussions, :content, :string
  end
end
