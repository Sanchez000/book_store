require 'factory_bot_rails'

create(:first_category)
create(:second_category)
create(:third_category)
create(:four_category)

35.times do
  first_author = FactoryBot.create(:random_author)
  second_author = FactoryBot.create(:random_author)

  book = FactoryBot.create(:random_book)
  BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/1.webp')
  BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/2.webp')
  BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/3.webp')
  BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/4.webp')
  BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/5.webp')

  AuthorBook.create(author_id: first_author.id, book_id: book.id)
  AuthorBook.create(author_id: second_author.id, book_id: book.id)
end
