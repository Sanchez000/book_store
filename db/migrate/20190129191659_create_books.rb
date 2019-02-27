class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :imagen
      t.string :title
      t.decimal :price
      t.references :categories
      t.timestamps
    end
  end
end
