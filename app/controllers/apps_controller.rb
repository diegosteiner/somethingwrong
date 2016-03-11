class AppsController < ApplicationController
  before_action :set_app, only: [:show, :problem, :ok]

  def index
  end

  def show
    render json: @app
  end

  def ok
  end

  def problem
  end

  private

  def set_app
    @app = App.find_or_initialize_by(slug: params[:id].parameterize)
  end
end
