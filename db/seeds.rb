# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'factory_bot_rails'

Categories.create([{ title: 'Mobile development' }, { title: 'Photo' }, { title: 'Web design' }, { title: 'Web development' }])

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
