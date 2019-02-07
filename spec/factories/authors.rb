require 'ffaker'
FactoryBot.define do
  factory :author do
    first_name { 'John' }
    last_name { 'Cochran' }
  end

  factory :random_author, class: Author do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end
end
