require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let!(:movie) { FactoryBot.create(:movie) }
  describe 'Get movies' do
    before do
      get :index
    end

    it 'renders template' do
      expect(response).to render_template(:index)
    end

    it 'return 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'Get show' do
    before do
      visit movie_path(movie)
    end

    it 'renders template' do
      expect(response).to render_template(:show)
    end

    it 'return 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'Get best_users' do
    before do
      get :best_users
    end

    it 'renders template' do
      expect(response).to render_template(:best_users)
    end

    it 'return 200' do
      expect(response).to have_http_status(200)
    end
  end
end
