require 'rails_helper'
require 'pry'

RSpec.feature 'Book page', type: :feature do
  let(:book) do
    Category::CATEGORIES_LIST.map { |category| FactoryBot.create(:category, category) }
    FactoryBot.create(:random_book)
  end

  describe "GET '/catalog/:id'", type: :feature do
    before(:each) do
      BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/1.webp')
      visit catalog_path(id: book.id)
    end

    it 'the description of a book has more than 6 lines of text' do
      expect(page.first('div.general-info-wrap.divider-lg')).to have_content('Read More')
    end

    it 'read more button is worked' do
      find('a.in-gold-500.ml-10').click
    end
  end
end
