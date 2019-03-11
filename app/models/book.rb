class Book < ApplicationRecord
  belongs_to :category
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :book_reviews
  has_many :reviews, through: :book_reviews
  has_many :book_photos
  accepts_nested_attributes_for :book_photos

  scope :newest, -> { order('created_at DESC') }
  scope :with_more_sales, -> { order('sales_count DESC') }
  scope :best, -> { select('DISTINCT ON (category_id) books.* ') }
  scope :sellers, -> { order('category_id, sales_count DESC') }

  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :dimensions
  validates_presence_of :description
  validates_presence_of :material
  validates_presence_of :category
end
