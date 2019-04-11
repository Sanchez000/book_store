require 'rails_helper'

RSpec.feature 'Book page', type: :feature do
  let(:category) { create(:category) }
  let(:book) { create(:random_book, category: category) }

  describe "GET '/catalog/:id'", type: :feature do
    before(:each) do
      BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/1.webp')
      BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/2.webp')
      BookPhoto.create(book: book, imagen: 'https://s3.amazonaws.com/sanchez000-cloud9/photos/3.webp')
      visit catalog_path(id: book.id)
    end

    it 'the description of a book has more than 6 lines of text' do
      expect(page.first('div.general-info-wrap.divider-lg')).to have_content('Read More')
    end

    it 'read more button is worked and open to user more content' do
      old_description_size = page.driver.evaluate_script <<-EOS
      function() {
        var ele  = document.getElementById('description');
        var rect = ele.getBoundingClientRect();
      return rect.height;
      }();
      EOS
      find('a.in-gold-500.ml-10').click
      new_description_size = page.driver.evaluate_script <<-EOS
      function() {
        var ele  = document.getElementById('description');
        var rect = ele.getBoundingClientRect();
      return rect.height;
      }();
      EOS
      expect(new_description_size).to be > old_description_size
      expect(page).to have_no_content('Read More')
      expect(page).to have_content('Read less')
    end

    it 'have `Back` button on the up left corner' do
      expect(page).to have_content('Back to results')
    end

    it '`Back` button redirects to the previous page on click' do
      visit catalog_index_path
      visit catalog_path(id: book.id)
      current_page_path = page.current_path
      find('a.general-back-link').click
      expect(page).to have_current_path(catalog_index_path)
    end

    it '`Back` button redirects to the previous page on click even if previous is home page' do
      visit root_path
      visit catalog_path(id: book.id)
      current_page_path = page.current_path
      find('a.general-back-link').click
      expect(page).to have_no_current_path(catalog_index_path)
      expect(page).to have_no_current_path(catalog_path(id: book.id))
      expect(page).to have_current_path(root_path)
    end

    it 'available catalog button on header' do
      find('a.dropdown-toggle.shop').click
      first('ul.dropdown-menu li a.collapse-link').click
      expect(page.current_path).not_to eq(catalog_path(id: book.id))
      expect(page).to have_current_path(catalog_index_path(categori_id: category.id))
    end

    it 'have three photos of book' do
      expect(page).to have_css('img.small-img', count: 3)
    end

    it 'changes the main photo when clicking on another photo thumbnail' do
      main_img_old = find('#main_img')['src']
      first_img = page.all('img.small-img')[0]
      second_img = page.all('img.small-img')[1]
      third_img = page.all('img.small-img')[2]
      second_img.click
      expect(page.find('#main_img')['src']).not_to eq(main_img_old)
      third_img.click
      expect(page.find('#main_img')['src']).not_to eq(main_img_old)
      first_img.click
      expect(page.find('#main_img')['src']).to eq(main_img_old)
    end

    it 'have `Home` button' do
      first('a', text: 'Home').click
      expect(page).to have_current_path(home_index_path)
    end
  end
end
