class ApplicationController < ActionController::Base
  respond_to :html, :json
  protect_from_forgery with: :exception
  CATEGORIES_COUNT = 4

  def find_all_categories
    @categories = Categories.decorate.first(CATEGORIES_COUNT)
    @count_all_books_in_all_catogories = @categories.map(&:books).flatten.size
  end
end
