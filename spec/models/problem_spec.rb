require 'rails_helper'

RSpec.describe Problem, type: :model do
  let(:app) { FactoryGirl.create(:app) }
  let(:problem) { FactoryGirl.build(:problem, app: app) }

  describe '#initialize' do
    subject { described_class.create!(problem.attributes) }

    it { is_expected.to be_valid }
    it { is_expected.to have_attributes(app: app, source: problem.source) }
  end

  describe 'scope: unsolved' do
    let!(:unsolved_problems) { FactoryGirl.create_list(:problem, 2, app: app, solved_at: nil) }
    let!(:solved_problems) { FactoryGirl.create_list(:problem, 2, app: app, solved_at: 1.hour.ago) }
    subject { described_class.unsolved }
    it { is_expected.to contain_exactly(*unsolved_problems) }
  end

  describe '#solve!' do
    it do
      problem.solve!
      expect(problem.solved?).to be(true)
    end
  end

  describe '#solved?' do
    before { expect(problem).to receive(:solved_at).once.and_return(solved_at) }
    subject { problem.solved? }

    context 'unsolved' do
      let(:solved_at) { nil }
      it { is_expected.to be(false) }
    end

    context 'solved' do
      let(:solved_at) { 1.hour.ago }
      it { is_expected.to be(true) }
    end
  end
end
