require 'rails_helper'

RSpec.describe CatalogController, type: :controller do
  let(:book) { FactoryBot.create(:book) }
  describe 'GET #index' do
    before { get :index }

    it 'has 200 status code if success loaded' do
      expect(response.status).to eql 200
    end

    it 'assigns @books' do
      expect(assigns(:books)).not_to be_nil
    end
  end

  describe 'GET #show' do
    before do
      allow(Book).to receive(:find_by) { book }
      get :show, params: { id: book.id }
    end

    it 'assigns @book' do
      expect(assigns(:book)).not_to be_nil
    end

    it 'render :show template' do
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end
end
