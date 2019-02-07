require 'ffaker'
FactoryBot.define do
  factory :book_photo do
    before(:create) do |book_photo|
      book_photo.book = FactoryBot.create(:random_book)
    end
    # current_book = FactoryBot.create(:random_book)
    # book { current_book }
    imagen { 'https://d31wxntiwn0x96.cloudfront.net/rzgade/productimages/1276.jpg?width=400&amp;height=400&amp;etag=%22a2ebd1488b087bf0e6db43ee8bae0634%22' }
    # book { current_book }
    imagen { 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ352GRUKdIFLP3va0Tj7QREidI4lwUABrtUJbQehqIL02O_blo' }
    # book { current_book }
    imagen { 'https://d31wxntiwn0x96.cloudfront.net/rzgade/productimages/1276.jpg?width=400&amp;height=400&amp;etag=%22a2ebd1488b087bf0e6db43ee8bae0634%22' }
    # book { current_book }
    imagen { 'https://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg' }
  end
end
