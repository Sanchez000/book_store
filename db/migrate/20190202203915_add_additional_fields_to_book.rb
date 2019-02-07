class AddAdditionalFieldsToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :publication_year, :integer
    add_column :books, :dimentions, :string
    add_column :books, :sales_count, :integer
    add_column :books, :description, :text
    add_column :books, :material, :string
  end
end
