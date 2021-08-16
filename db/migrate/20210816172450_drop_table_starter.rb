class DropTableStarter < ActiveRecord::Migration[6.1]
  def change
    drop_table :starters
  end
end
