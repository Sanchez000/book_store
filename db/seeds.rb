# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'factory_bot_rails'

Category.create([{ title: 'Mobile development' }, { title: 'Photo' }, { title: 'Web design' }, { title: 'Web development' } ])

5.times do
  FactoryBot.create(:random_user)
  FactoryBot.create(:random_author)
end

8.times do
  book = FactoryBot.create(:random_book)
  BookPhoto.create(book: book, imagen: 'https://d31wxntiwn0x96.cloudfront.net/rzgade/productimages/1276.jpg?width=400&amp;height=400&amp;etag=%22a2ebd1488b087bf0e6db43ee8bae0634%22' )
  BookPhoto.create(book: book, imagen: 'https://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg' )
  BookPhoto.create(book: book, imagen: 'https://d31wxntiwn0x96.cloudfront.net/rzgade/productimages/1276.jpg?width=400&amp;height=400&amp;etag=%22a2ebd1488b087bf0e6db43ee8bae0634%22' )
  BookPhoto.create(book: book, imagen: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ352GRUKdIFLP3va0Tj7QREidI4lwUABrtUJbQehqIL02O_blo' )
end

AuthorBook.create(author_id: 1, book_id: 2)
AuthorBook.create(author_id: 2, book_id: 2)
AuthorBook.create(author_id: 3, book_id: 2)
AuthorBook.create(author_id: 1, book_id: 1)
AuthorBook.create(author_id: 1, book_id: 3)
AuthorBook.create(author_id: 2, book_id: 3)
AuthorBook.create(author_id: 3, book_id: 3)
AuthorBook.create(author_id: 1, book_id: 4)
AuthorBook.create(author_id: 2, book_id: 4)
AuthorBook.create(author_id: 1, book_id: 5)
AuthorBook.create(author_id: 2, book_id: 5)
AuthorBook.create(author_id: 1, book_id: 6)
AuthorBook.create(author_id: 3, book_id: 6)
AuthorBook.create(author_id: 3, book_id: 7)
AuthorBook.create(author_id: 2, book_id: 7)
AuthorBook.create(author_id: 2, book_id: 8)
AuthorBook.create(author_id: 4, book_id: 8)
# author_books
# authors +++++++
# book_photos
# book_reviews ----------
# books+++++++++++
# categories++++++
# reviews---------
# users ++++++++++
