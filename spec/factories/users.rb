require 'ffaker'
FactoryBot.define do
  factory :user do
    name  { 'John Doe' }
    email  { 'john.doe@example.com' }
    addres { '306 Cronin Lane, 4708 Watsica Fords, 652 September Burgs' }
    photo { 'https://via.placeholder.com/300x300/ea510c/6c7a96.png?text=' }
  end

  factory :random_user, class: User do
    name { FFaker::Name.name }
    email { FFaker::Internet.safe_email }
    addres { FFaker::Address.street_address }
    photo { FFaker::Image.url }
  end
end
