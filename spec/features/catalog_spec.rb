require 'rails_helper'

RSpec.feature 'Catalog page', type: :feature do
  background do
    Category::CATEGORIES_LIST.map { |category| FactoryBot.create(:category, category) }
    15.times do
      book = FactoryBot.create(:random_book)
      BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/1.webp')
    end
    @books = Book.all
    @categories = Categories.all
  end

  describe "GET '/catalog'", type: :feature do
    before(:each) do
      visit catalog_index_path
    end

    it 'the guest is exactly on the catalog page' do
      expect(page.find('h1.general-title-margin')).to have_content('Сatalog')
    end

    it 'at the first opening books sorted alphabetically' do
      expect(page.find('#dropdownMenuLink').text).to eq 'Title: A - Z'
    end

    it 'sorted books by filter #Price: Hight to low' do
      within('div.hidden-xs.clearfix') do
        find('a.dropdown-toggle.lead.small').click
        find('ul.dropdown-menu').click_link('Price: Hight to low')
      end

      expect(all('.title').first.text).to eq Book.all.order('price desc').first.title
    end

    it 'sorted books by filter #Price: Low to hight' do
      within('div.hidden-xs.clearfix') do
        find('a.dropdown-toggle.lead.small').click
        find('ul.dropdown-menu').click_link('Price: Low to hight')
      end
      expect(all('.title').first.text).to eq Book.all.order('price asc').first.title
    end

    it 'transfer to book page onclick on selected book' do
      within('div#main_row') do
        first('div.general-thumb-wrap').hover
        @final_path = page.find('a.thumb-hover-link.watch')['href']
        find('a.thumb-hover-link.watch').click
      end
      expect(page).to have_current_path(@final_path)
    end
  end
end
