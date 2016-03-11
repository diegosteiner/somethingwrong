require 'rails_helper'

RSpec.describe App, type: :routing do
  describe 'GET apps' do
    subject { { get: '/apps' } }
    it { is_expected.to route_to(controller: 'apps', action: 'index') }
  end
end
