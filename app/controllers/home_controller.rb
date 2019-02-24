class HomeController < ApplicationController
  def index
    @latest_books = Book.newest.first(3)
    @best_sellers = Book.with_more_sales.first(4)
  end
end
