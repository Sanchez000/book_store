require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'assigns @latest_books' do
      expect(assigns(:latest_books)).not_to be_nil
    end

    it 'assigns @best_sellers' do
      expect(assigns(:best_sellers)).not_to be_nil
    end

    it 'has 200 status code if success loaded' do
      expect(response.status).to eql 200
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end
end
