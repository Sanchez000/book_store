class HomeController < ApplicationController
  def index
    @categorys = Category.all
    @latest_books = Book.order('created_at DESC').first(3)
    @best_sellers = Book.order('sales_count DESC').first(4)
  end
end
