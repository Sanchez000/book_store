class CatalogService
  attr_reader :params

  def initialize(params)
    @params = params
  end
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

  class << self
    def select_books(params)
      params[:id] ? sort_current_categories(params) : sort_all_books(params)
    end

    def sorting(params)
      SORTING_ORDER[sort_column(params).to_sym][sort_direction(params).to_sym]
    end

    def sort_all_books(params)
      Book.all.limit(12).order("#{sort_column(params)} #{sort_direction(params)}")
    end

    def sort_current_categories(params)
      Category.find_by(id: params[:id]).books.order("#{sort_column(params)} #{sort_direction(params)}")
    end

    private

    def sortable_columns
      %w[title price sales_count created_at]
    end

    def sort_column(params)
      sortable_columns.include?(params[:column]) ? params[:column] : 'title'
    end

    def sort_direction(params)
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
  end
end
