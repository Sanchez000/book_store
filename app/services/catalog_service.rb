class CatalogService
  attr_reader :params

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

  def initialize(params)
    @params = params
  end

  def select_books
    params[:id] ? sort_current_categories : sort_all_books
  end

  def sorting
    SORTING_ORDER[sort_column.to_sym][sort_direction.to_sym]
  end

  def sort_all_books
    Book.all.limit(12).order("#{sort_column} #{sort_direction}")
  end

  def sort_current_categories
    Category.find_by(id: params[:id]).books.order("#{sort_column} #{sort_direction}")
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
