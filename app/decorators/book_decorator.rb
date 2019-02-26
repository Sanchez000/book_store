class BookDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def main_photo
    object.book_photos.first.imagen
  end

  def authors
    object.author.map { |author| author.first_name + ' ' + author.last_name }.join(', ')
  end
end
