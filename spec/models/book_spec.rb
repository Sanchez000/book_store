require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { described_class.new }

  it 'is not valid without title, price, author' do
    expect(subject).to_not be_valid
  end

  it { should have_many(:authors) }
  it { should have_many(:book_photos) }
  it { should belong_to(:category) }
  it { should have_many(:book_reviews) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:dimensions) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:material) }
  it { should validate_presence_of(:category) }
end
