require 'rails_helper'

describe PhotoSearchesController do
  describe 'GET #index' do
    let!(:registration) { '1234567' }
    let!(:stock_ref) { '123456789' }



    context 'without params' do
      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
    end
    context 'with params' do
      it 'assigns the candidate images' do
        get :index, registration: registration, stock_ref: stock_ref
        photosearch = PhotoSearch.new(registration: registration, stock_ref: stock_ref)
        expect(assigns(:photo_search)).to eq photosearch
      end
      it 'renders the :index template' do
        get :index, registration: stock_ref, reference: registration
        expect(response).to render_template :index
      end
    end

  end
end
