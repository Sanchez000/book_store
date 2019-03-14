require 'rails_helper'

RSpec.feature 'Catalog page', type: :feature do
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

    @books = Book.all
    @categories = Category.all
  end

  describe "GET '/catalog'", type: :feature do
    before(:each) do
      visit catalog_index_path
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

    it 'contains twelve books per page' do
      expect(page).to have_css('div.col-xs-6.col-sm-3.custom_class', count: 12)
    end

    it 'contains pagination on the page' do
      expect(page).to have_css('ul.pagination')
    end

    it 'switches between pages correctly and have correct count of books' do
      old_title_first_book = all('.title').first.text
      find('ul.pagination li a', text: 'Last »').click
      expect(all('.title').first.text).not_to eq(old_title_first_book)
      expect(page).to have_css('div.col-xs-6.col-sm-3.custom_class', count: 9)
    end

    it 'switches between categories correctly and have correct count of books' do
      first_displayed_category = all('li.mr-35 a')[1]
      path_destiny = first_displayed_category['href']
      first_displayed_category.click
      expect(page).to have_current_path(path_destiny)
      expect(page).to have_css('div.col-xs-6.col-sm-3.custom_class', count: 12)
      find('ul.pagination li a', text: 'Last »').click
      expect(page).to have_css('div.col-xs-6.col-sm-3.custom_class', count: 3)
    end
  end
end
