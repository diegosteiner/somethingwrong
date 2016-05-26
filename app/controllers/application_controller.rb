# frozen_string_literal: true
class ApplicationController < ActionController::API
  include ActionController::Serialization

  private

  def authorize!
    return unless ENV['API_KEY'].present?
    render(json: { error: 'unauthorized' }, status: 403) unless params[:api_key] == ENV.fetch('API_KEY')
  end
end
