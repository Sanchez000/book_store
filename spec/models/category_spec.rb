require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { described_class.new }

  it { should have_many(:books) }
  it { should validate_presence_of(:title) }

  it 'is valid with valid attributes' do
    subject.title = 'Anything'
    expect(subject).to be_valid
  end
end
