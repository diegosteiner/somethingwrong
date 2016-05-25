require 'rails_helper'

RSpec.describe AppsController, type: :controller do
  before { allow(controller).to receive(:authorize!) }
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
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(:success)

      expect(json[:data][:links][:self]).to eq(app_path(app))
      expect(json[:data][:links][:solution]).to eq(solution_app_path(app))
      expect(json[:data][:links][:problem]).to eq(problem_app_path(app))
    end
  end

  describe 'GET problems' do
    let!(:problems) { create(:solved_problem, app: app) }
    let!(:unsolved_problems) { create_list(:problem, 3, app: app) }
    it 'returns http success' do
      get :problems, params: { id: app.id }

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(:success)
      expect(json[:meta]).to include(total: app.problems.unsolved.count)
      expect(json[:data][0][:attributes]).to include(solved: false, app_id: app.id)
    end
  end

  describe 'POST problem' do
    let(:json) { { key: 'value' } }
    it 'returns http success' do
      post :problem, params: json.merge(id: app.id)
      expect(response).to have_http_status(:success)
      app.reload
      expect(app.ok?).to be(false)
      expect(app.problems.last.data).to eq(json.deep_stringify_keys)
    end
  end

  describe 'POST solution' do
    let!(:problem) { create(:problem, app: app) }
    before do
      expect(App).to receive(:find_by).once.and_return(app)
      expect(app).to receive(:solve_problems!).once
    end
    it 'returns http success' do
      post :solution, params: { id: app.id }
      expect(response).to have_http_status(:success)
    end
  end
end
