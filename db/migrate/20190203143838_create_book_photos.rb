class CreateBookPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :book_photos do |t|
      t.string :imagen
      t.timestamps
    end
  end
end
