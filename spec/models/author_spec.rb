require 'rails_helper'

RSpec.describe Author, type: :model do
  it { should have_many(:author_books) }
  it { should have_many(:books).through(:author_books) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
end
