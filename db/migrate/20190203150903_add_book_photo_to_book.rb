class AddBookPhotoToBook < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :book_photo, foreign_key: true
  end
end
