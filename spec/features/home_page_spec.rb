require 'rails_helper'

RSpec.feature 'Home page', type: :feature do
  background do
    first_category = create(:first_category)
    15.times do
      book = create(:random_book, category: first_category)
      BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/1.webp')
    end
    second_category = create(:second_category)
    15.times do
      book = create(:random_book, category: second_category)
      BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/2.webp')
    end

    third_category = create(:third_category)
    15.times do
      book = create(:random_book, category: third_category)
      BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/3.webp')
    end

    four_category = create(:four_category)
    15.times do
      book = create(:random_book, category: four_category)
      BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/4.webp')
    end

    @books = Book.all
    @categories = Category.all
  end

  describe "GET '/'", type: :feature do
    before(:each) do
      visit home_index_path
    end

    it 'have main button for catalog' do
      expect(page).to have_selector("input[value='Get Started']")
    end

    it 'transfer to catalog page onclick button `Get Started`' do
      find("input[value='Get Started']").click
      expect(page).to have_current_path(catalog_index_path)
    end

    it 'contains four best sellers' do
      expect(page).to have_css('div.col-sm-6.col-md-3', count: 4)
    end

    it 'have carousel and one active element' do
      expect(page).to have_css('div.item.active', count: 1)
    end

    it 'transfer to book page onclick on selected best seller' do
      first('div.general-thumb-wrap').hover
      @final_path = page.find('a.thumb-hover-link.watch')['href']
      find('a.thumb-hover-link.watch').click
      expect(page).to have_current_path(@final_path)
    end
  end
end
