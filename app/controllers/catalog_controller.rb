class CatalogController < ApplicationController
  def index
    service = CatalogService.new(params)
    @sorting_order = service.sorting
    @selected_category_id = params[:id] if params[:id]
    @selected_page = params[:page] || 1
    @books = service.select_books.page(params[:page]).decorate
  end

  def show
    @book = Book.find_by(id: params[:id])
    @book_presenter = BookPresenter.new(@book, view_context)
  end
end
