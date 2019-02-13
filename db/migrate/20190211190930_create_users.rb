class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :token
      t.string :provider
      t.string :avatar
      t.text :image
      t.string :addres

      t.timestamps
    end
  end
end
