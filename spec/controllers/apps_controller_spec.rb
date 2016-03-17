require 'rails_helper'

RSpec.describe AppsController, type: :controller do
  let!(:app) { create(:app) }
  describe 'GET index' do
    it 'returns http success' do
      get :index
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(:success)
      expect(json[:meta]).to include(total: App.all.count)
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      get :show, params: { id: app.to_param }
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(:success)
      expect(json[:data][:attributes]).to include(name: app.name, ok: true)
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      get :show, params: { id: app.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST problem' do
    let(:json) { { key: :value } }
    it 'returns http success' do
      post :problem, params: json.merge(id: app.id)
      expect(response).to have_http_status(:success)
      app.reload
      expect(app.problems.count).to be(1)
      expect(app.ok?).to be(false)
    end
  end
end
