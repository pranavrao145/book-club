class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :google_books_id

      t.timestamps
    end
  end
end
