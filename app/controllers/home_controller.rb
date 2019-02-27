class HomeController < ApplicationController
  def index
    @latest_books = Book.newest.decorate.first(3)
    @best_sellers = Book.with_more_sales.decorate.first(4)
  end
end
