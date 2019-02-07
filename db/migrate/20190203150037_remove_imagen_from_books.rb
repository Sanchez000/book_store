class RemoveImagenFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :imagen
  end
end
