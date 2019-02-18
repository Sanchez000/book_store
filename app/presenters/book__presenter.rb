class BookPresenter < BasePresenter
  presents :book

  def authors_list
    @model.author.map { |author| author.first_name + ' ' + author.last_name }.join(', ')
  end
end
