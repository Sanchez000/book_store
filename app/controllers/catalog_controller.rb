class CatalogController < ApplicationController
  SORTING_ORDER = {
    price: {
      asc: 'Price: Low to hight',
      desc: 'Price: Hight to low'
    },
    title: {
      asc: 'Title: A - Z',
      desc: 'Title: Z - A'
    },
    sales_count: {
      asc: 'Popular first',
      desc: 'Popular first'
    },
    created_at: {
      asc: 'Newest first',
      desc: 'Newest first'
    }
  }.freeze

  def index
    # @categorys = Category.all
    @sorting_order = SORTING_ORDER[sort_column.to_sym][sort_direction.to_sym]
          @books = if params[:id]
                     @selected_category_id = params[:id]
                     Category.find_by(id: params[:id]).books.order("#{sort_column} #{sort_direction}")
                   else
                     Book.all.limit(12).order("#{sort_column} #{sort_direction}")
                   end
  end

  def show
    @path_to_back = request.referer
    # @categorys = Category.all
    book = Book.find_by(id: params[:id])
    @book = book
    @book_presenter = BookPresenter.new(book, view_context)
  end

  private

  def sortable_columns
    %w[title price sales_count created_at]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : 'title'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
