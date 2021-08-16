class CreateStarters < ActiveRecord::Migration[6.1]
  def change
    create_table :starters do |t|
      t.string :title
      t.string :content
      t.references :discussion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
