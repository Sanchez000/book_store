class CatalogService
  attr_reader :params

  SORTABLE_COLUMNS = %w[title price sales_count created_at].freeze

  SORTING_ORDER = {
    price: {
      asc: I18n.t('services.catalog.price_asc'),
      desc: I18n.t('services.catalog.price_desc')
    },
    title: {
      asc: I18n.t('services.catalog.title_asc'),
      desc: I18n.t('services.catalog.title_desc')
    },
    sales_count: {
      asc: I18n.t('services.catalog.sales_count_asc'),
      desc: I18n.t('services.catalog.sales_count_desc')
    },
    created_at: {
      asc: I18n.t('services.catalog.created_at_asc'),
      desc: I18n.t('services.catalog.created_at_desc')
    }
  }.freeze

  def initialize(params)
    @params = params
  end

  def select_books
    params[:categori_id] ? sort_current_categories : sort_all_books
  end

  def sorting
    SORTING_ORDER[sort_column.to_sym][sort_direction.to_sym]
  end

  def sort_all_books
    Book.all.order("#{sort_column} #{sort_direction}")
  end

  def sort_current_categories
    Categories.find_by(id: params[:categori_id]).books.order("#{sort_column} #{sort_direction}")
  end

  private

  def sort_column
    SORTABLE_COLUMNS.include?(params[:column]) ? params[:column] : I18n.t('services.catalog.default_sotring_column')
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : I18n.t('services.catalog.base_sotring_direction')
  end
end
