# frozen_string_literal: true
require 'rails_helper'

RSpec.describe App, type: :routing do
  let!(:app) { create(:app) }
  describe 'GET apps' do
    subject { { get: '/apps' } }
    it { is_expected.to route_to(controller: 'apps', action: 'index') }
  end

  describe 'GET app' do
    subject { { get: "/apps/#{app.slug}" } }
    it { is_expected.to route_to(controller: 'apps', action: 'show', id: app.slug) }
  end

  describe 'POST problem' do
    subject { { post: "/apps/#{app.slug}/problem" } }
    it { is_expected.to route_to(controller: 'apps', action: 'problem', id: app.slug) }
  end

  describe 'GET problems' do
    subject { { get: "/apps/#{app.slug}/problems" } }
    it { is_expected.to route_to(controller: 'apps', action: 'problems', id: app.slug) }
  end

  describe 'POST solution' do
    subject { { post: "/apps/#{app.slug}/solution" } }
    it { is_expected.to route_to(controller: 'apps', action: 'solution', id: app.slug) }
  end
end
