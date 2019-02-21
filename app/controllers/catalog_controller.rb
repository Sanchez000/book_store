class CatalogController < ApplicationController

  def index
    @sorting_order = CatalogService.sorting(params)
    @selected_category_id = params[:id] if params[:id]
    @books = CatalogService.select_books(params)
  end

  def show
    book = Book.find_by(id: params[:id])
    @book = book
    @book_presenter = BookPresenter.new(book, view_context)
  end
end
