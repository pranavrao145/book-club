class LoadDbSchema < ActiveRecord::Migration[6.1]
  def change
    create_table 'discussions', force: :cascade do |t|
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.string 'gbook_id', null: false
      t.string 'title', null: false
      t.string 'content', null: false
      t.string 'book_name', null: false
      t.integer 'author_id', null: false
      t.index ['author_id'], name: 'index_discussions_on_author_id'
    end

    create_table 'replies', force: :cascade do |t|
      t.string 'content', null: false
      t.integer 'discussion_id', null: false
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.integer 'author_id'
      t.index ['author_id'], name: 'index_replies_on_author_id'
      t.index ['discussion_id'], name: 'index_replies_on_discussion_id'
    end

    create_table 'reviews', force: :cascade do |t|
      t.integer 'rating', null: false
      t.string 'title', null: false
      t.integer 'author_id', null: false
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.string 'gbook_id', null: false
      t.text 'content'
      t.string 'book_name', null: false
      t.index ['author_id'], name: 'index_reviews_on_author_id'
    end

    create_table 'users', force: :cascade do |t|
      t.string 'email', default: '', null: false
      t.string 'encrypted_password', default: '', null: false
      t.string 'reset_password_token'
      t.datetime 'reset_password_sent_at'
      t.datetime 'remember_created_at'
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.string 'username', null: false
      t.index ['email'], name: 'index_users_on_email', unique: true
      t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
      t.index ['username'], name: 'index_users_on_username', unique: true
    end

    add_foreign_key 'discussions', 'users', column: 'author_id'
    add_foreign_key 'replies', 'discussions'
    add_foreign_key 'replies', 'users', column: 'author_id'
  end
end
