require 'ffaker'
require 'faker'
FactoryBot.define do
  factory :book do
    title { 'Android Programming for Beginners' }
    price { 10.00 }
    category_id { 2 }
    publication_year { 2016 }
    dimensions { { height: 1, weight: 2, depth: 3 } }
    sales_count { 1 }
    description {  'Smashing Book 5: Real-Life Responsive Web Design is our brand new,
                   upcoming book with smart front-end techniques and design patterns
                   derived from real-life responsive projects.
                   With 13 chapters on responsive workflow, SVG, Flexbox, Web fonts,
                   responsive images, responsive email, content strategy, debugging'
                 }
    material { 'Hardcove, glossy paper' }
  end

  factory :random_book, class: Book do
    title { FFaker::Book.title }
    price { Faker::Commerce.price }
    category_id { rand(1..4) }
    publication_year { FFaker::Vehicle.year }
    dimensions { { height: FFaker::Vehicle.engine_displacement, weight: FFaker::Vehicle.engine_displacement, depth: FFaker::Vehicle.engine_displacement } }
    sales_count { rand(1..15) }
    description { FFaker::Book.description(12) }
    material { Faker::Commerce.material }
  end
end
