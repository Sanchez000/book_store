# frozen_string_literal: true

class Categories < ApplicationRecord
  has_many :books
end
