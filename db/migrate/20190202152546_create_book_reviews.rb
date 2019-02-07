# frozen_string_literal: true

class CreateBookReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :book_reviews do |t|
      t.references :book
      t.references :review
      t.timestamps
    end
  end
end
