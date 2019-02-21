module CatalogService
  class << self
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

  def sorting(params)
     SORTING_ORDER[sort_column(params).to_sym][sort_direction(params).to_sym]    
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