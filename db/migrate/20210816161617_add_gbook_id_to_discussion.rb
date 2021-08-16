class AddGbookIdToDiscussion < ActiveRecord::Migration[6.1]
  def change
    add_column :discussions, :gbook_id, :string
  end
end
