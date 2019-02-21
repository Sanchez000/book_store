class CatalogController < ApplicationController

  def index
    @sorting_order = CatalogService.sorting(params)
          @books = if params[:id]
                     @selected_category_id = params[:id]
                     CatalogService.sort_current_categories(params)
                   else
                     CatalogService.sort_all_books(params)
                   end
  end

  def show
    book = Book.find_by(id: params[:id])
    @book = book
    @book_presenter = BookPresenter.new(book, view_context)
  end

end
