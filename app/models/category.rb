class Category < ApplicationRecord
  has_many :books

  CATEGORIES_LIST = ['Mobile development', 'Photo', 'Web design', 'Web development'].freeze

  validates_presence_of :title
end
