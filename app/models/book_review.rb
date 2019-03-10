class BookReview < ApplicationRecord
  belongs_to :review
  belongs_to :book
end
