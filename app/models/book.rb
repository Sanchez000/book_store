class Book < ApplicationRecord
  has_many :author_book
  has_many :author, through: :author_book
  belongs_to :categories
  has_many :book_review
  has_many :review, through: :book_review
  has_many :book_photos
  accepts_nested_attributes_for :book_photos
  paginates_per 8

  scope :newest, -> { order('created_at DESC') }
  scope :with_more_sales, -> { order('sales_count DESC') }
end
