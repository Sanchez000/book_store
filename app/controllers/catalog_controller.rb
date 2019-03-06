class CatalogController < ApplicationController
  MIN_QUANTITY_PAGE = 1

  def index
    service = CatalogService.new(params)
    @sorting_order = service.sorting
    @selected_category_id = params[:categori_id] if params[:categori_id]
    @selected_page = params[:page] || MIN_QUANTITY_PAGE
    @books = service.select_books.page(params[:page]).decorate
  end

  def show
    @book = Book.find_by(id: params[:id]).decorate
  end
end
