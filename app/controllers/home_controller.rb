class HomeController < ApplicationController
  LATES_BOOKS = 3
  BEST_SELLERS = 4

  def index
    @latest_books = Book.newest.decorate.first(LATES_BOOKS)
    @best_sellers = Book.with_more_sales.decorate.first(BEST_SELLERS)
  end
end
