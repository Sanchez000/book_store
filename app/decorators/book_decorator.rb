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

  def list_dimensions
    "H: #{object.dimensions['height']} x W: #{object.dimensions['weight']}  x D: #{object.dimensions['depth']}"
  end
end
