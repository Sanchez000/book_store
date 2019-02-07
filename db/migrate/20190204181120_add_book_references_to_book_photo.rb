class AddBookReferencesToBookPhoto < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_photos, :book, foreign_key: true
  end
end
