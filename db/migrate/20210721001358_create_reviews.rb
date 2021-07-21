class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :title
      t.string :content
      t.references :book, null: false, foreign_key: false
      t.references :author, null: false, foreign_key: false

      t.timestamps
    end
    add_foreign_key :reviews, :books, column: :author_id
  end
end
