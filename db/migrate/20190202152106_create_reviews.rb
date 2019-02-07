# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.integer :rating
      t.text :text

      t.timestamps
    end
  end
end
