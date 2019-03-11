class Category < ApplicationRecord
  has_many :books

  CATEGORIES_LIST = [
    { title: 'Mobile development' },
    { title: 'Photo' },
    { title: 'Web design' },
    { title: 'Web development' }
  ].freeze

  validates_presence_of :title
end
