class ApplicationController < ActionController::Base
  respond_to :html, :json
  protect_from_forgery with: :exception
  before_action :find_all_categories, only: %i[show index]

  CATEGORIES_COUNT = 4

  def find_all_categories
    @categories = Category.limit(CATEGORIES_COUNT).decorate
  end
end
