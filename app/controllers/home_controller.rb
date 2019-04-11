class HomeController < ApplicationController
  LATES_BOOKS = 3

  def index
    @latest_books = Book.newest.decorate.first(LATES_BOOKS)
    @best_sellers = Book.best.sellers.decorate
  end
end
