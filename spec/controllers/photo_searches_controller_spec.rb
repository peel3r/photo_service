require 'rails_helper'

describe PhotoSearchesController do
  describe 'GET #new' do
    context 'without params' do
      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end

      context 'without params' do
        let(:ref)  {'ADRDNFF1A5-KUM4'}

        it 'renders the :photo_searches#index template' do
          get :new, ref
          expect(response).to render_template :new
        end
      end
    end
  end
end
