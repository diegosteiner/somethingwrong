require 'rails_helper'

RSpec.describe AppsController, type: :controller do
  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET show' do
    let!(:app) { FactoryGirl.create(:app) }
    it 'returns http success' do
      get :show, id: app.to_param
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json).to include('name' => app.name, 'ok' => true)
    end
  end
end
