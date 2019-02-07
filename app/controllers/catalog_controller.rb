class CatalogController < ApplicationController
  # helper_method :sort_column, :sort_direction

  def index
    @categorys = Category.all
    @books = if params[:id]
               @selected_category_id = params[:id]
               Category.find_by(id: params[:id]).books.order("#{sort_column} #{sort_direction}")
             else
               Book.all.limit(12).order("#{sort_column} #{sort_direction}")
             end
  end
  
  def show
    @current_user
    @categorys = Category.all
    @book = Book.find_by(id: params[:id])
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
