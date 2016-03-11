require 'rails_helper'

RSpec.describe App, type: :model do
  describe '#initialize' do
    subject { App.new(name: 'Name') }

    it { is_expected.to be_valid }
  end
end
