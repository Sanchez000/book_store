class CategoryDecorator < ApplicationDecorator
  delegate_all

  def count_books
    object.books.size
  end
end
