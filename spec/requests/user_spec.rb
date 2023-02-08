require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'GET /user' do
    before(:example) { get '/user' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the :index template' do
      expect(response).to render_template(:index)
    end

    it 'display header in the body response' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET /user/:id' do
    before(:example) { get '/user/12' }

    it 'return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the :show template' do
      expect(response).to render_template(:show)
    end

    it 'display header in the body response' do
      expect(response.body).to include('Here is a user informations for a given user')
    end
  end
end
