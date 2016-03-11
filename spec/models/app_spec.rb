require 'rails_helper'

RSpec.describe App, type: :model do
  describe '#initialize' do
    let(:app) { FactoryGirl.build(:app) }
    subject { App.create!(app.attributes) }

    it { is_expected.to be_valid }
    it { is_expected.to have_attributes({ name: app.name, slug: app.name.parameterize }) }
  end
end
