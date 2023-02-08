require 'rails_helper'

RSpec.describe 'Post', type: :request do
  describe 'GET /user/:id/post' do
    before(:example) { get '/user/12/post' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the :index template' do
      expect(response).to render_template(:index)
    end

    it 'display header in the body response' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /user/:id/post/:id' do
    before(:example) { get '/user/12/post/24' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the :show template' do
      expect(response).to render_template(:show)
    end

    it 'display header in the body response' do
      expect(response.body).to include('Here is a single post from list of posts for a given user')
    end
  end
end