class ChangeDimensionsToBeJsonInBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :dimentions
    add_column :books, :dimensions, :json
  end
end
