ActiveRecord::Schema.define(version: 2019_02_13_151203) do
  enable_extension 'plpgsql'

  create_table 'author_books', force: :cascade do |t|
    t.bigint 'author_id'
    t.bigint 'book_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_author_books_on_author_id'
    t.index ['book_id'], name: 'index_author_books_on_book_id'
  end

  create_table 'authors', force: :cascade do |t|
    t.string 'first_name'
    t.string 'middle_name'
    t.string 'last_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'book_photos', force: :cascade do |t|
    t.string 'imagen'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'book_id'
    t.index ['book_id'], name: 'index_book_photos_on_book_id'
  end

  create_table 'book_reviews', force: :cascade do |t|
    t.bigint 'book_id'
    t.bigint 'review_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_book_reviews_on_book_id'
    t.index ['review_id'], name: 'index_book_reviews_on_review_id'
  end

  create_table 'books', force: :cascade do |t|
    t.string 'title'
    t.decimal 'price'
    t.bigint 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'publication_year'
    t.string 'dimentions'
    t.integer 'sales_count'
    t.text 'description'
    t.string 'material'
    t.index ['category_id'], name: 'index_books_on_category_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'reviews', force: :cascade do |t|
    t.string 'title'
    t.bigint 'user_id'
    t.integer 'rating'
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'uid'
    t.string 'token'
    t.string 'avatar'
    t.string 'addres'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'provider'
    t.text 'image'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'book_photos', 'books'
end
