class BookDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def main_photo
    object.book_photos.first.imagen
  end

  def authors
    object.authors.map { |author| author.first_name + ' ' + author.last_name }.join(', ')
  end

  def list_dimentions
    "H: #{object.dimentions} x W: #{object.dimentions}  x D: #{object.dimentions}"
  end
end
