require 'rails_helper'

RSpec.describe AppsController, type: :controller do
  describe 'GET index' do
    it 'returns http success' do
      get :index
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(:success)
      expect(json[:meta]).to include(total: App.all.count)
    end
  end

  describe 'GET show' do
    let!(:app) { FactoryGirl.create(:app) }
    it 'returns http success' do
      get :show, id: app.to_param
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(:success)
      expect(json[:data][:attributes]).to include(name: app.name, ok: true)
    end
  end

  describe 'GET show' do
    let!(:app) { FactoryGirl.create(:app) }
    it 'returns http success' do
      get :show, id: app.id
      expect(response).to have_http_status(:success)
    end
  end
end
