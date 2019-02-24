class BookPresenter
  def initialize(book, template)
    @book = book
    @template = template
  end

  def authors_list
    @book.author.map { |author| author.first_name + ' ' + author.last_name }.join(', ')
  end

  def first_image
    @book.book_photos.first.imagen
  end
end
