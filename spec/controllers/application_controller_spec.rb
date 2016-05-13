require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#authorize!' do
    controller do
      before_action :authorize!
      def index
        render plain: 'test'
      end
    end
    let(:text) { 'test' }
    let(:api_key) { SecureRandom.hex(26) }
    before { allow(ENV).to receive(:fetch).with('API_KEY').and_return(api_key) }

    context 'with no API_KEY set' do
      let(:api_key) { nil }
      it 'returns text' do
        get :index, params: { api_key: 'test' }
        expect(response).to be_success
        expect(response.body).to include(text)
      end
    end

    context 'with valid API_KEY in params' do
      it 'returns text' do
        get :index, params: { api_key: api_key }
        expect(response).to be_success
        expect(response.body).to include(text)
      end
    end

    context 'with invalid API_KEY in params' do
      it 'returns 403' do
        get :index
        expect(response).to have_http_status(403)
        expect(response.body).not_to include(text)
      end
    end
  end
end
