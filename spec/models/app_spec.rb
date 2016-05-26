# frozen_string_literal: true
require 'rails_helper'

RSpec.describe App, type: :model do
  let(:app) { FactoryGirl.create(:app) }

  describe '#initialize' do
    let(:app) { FactoryGirl.build(:app) }
    subject { described_class.create!(app.attributes) }

    it { is_expected.to be_valid }
    it { is_expected.to have_attributes(name: app.name, slug: app.name.parameterize) }
  end

  describe '#ok?' do
    subject { app.ok? }

    context 'with no problems' do
      it { is_expected.to be(true) }
    end

    context 'with solved problems' do
      let!(:problems) { create_list(:solved_problem, 3, app: app) }
      it { is_expected.to be(true) }
    end

    context 'with unsolved problems' do
      let!(:problems) { create_list(:problem, 3, app: app) }
      it { is_expected.to be(false) }
    end
  end

  describe '#solve_problems!' do
    let!(:problems) { create_list(:problem, 3, app: app) }
    subject { app.solve_problems! }

    it 'resolves all problems' do
      is_expected.to be(true)
      expect(app.problems.unsolved.any?).to be(false)
      expect(app.ok?).to be(true)
    end
  end
end
