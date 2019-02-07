class Book < ApplicationRecord
  has_many :author_book
  has_many :author, :through => :author_book
  belongs_to :category
  has_many :book_review
  has_many :review, :through => :book_review
  has_many :book_photos
  accepts_nested_attributes_for :book_photos
end
