class CategoriesDecorator < ApplicationDecorator
  delegate_all

  def count_books
    object.books.count
  end

  def all_books_in_all_catogories
    object.map(&:books).flatten.size
  end
end
