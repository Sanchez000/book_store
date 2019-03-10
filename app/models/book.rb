class Book < ApplicationRecord
  belongs_to :category, optional: true
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :book_reviews
  has_many :reviews, through: :book_reviews
  has_many :book_photos
  accepts_nested_attributes_for :book_photos
  paginates_per 12

  scope :newest, -> { order('created_at DESC') }
  scope :with_more_sales, -> { order('sales_count DESC') }

  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :dimentions
end
