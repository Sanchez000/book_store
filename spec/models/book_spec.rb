require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { described_class.new }

  it 'is not valid without title, price, author' do
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    subject.title = 'Anything'
    subject.author = [FactoryBot.create(:random_author), FactoryBot.create(:random_author)]
    subject.price = '€10.00'
    subject.dimentions = '10.0 10.0 10.0'
    expect(subject).to be_valid
  end
end
