class RemoveBookPhotoIdFromBook < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :book_photo_id
  end
end
