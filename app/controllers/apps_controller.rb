class AppsController < ApplicationController
  before_action :set_app, only: [:show, :problem, :ok]

  def index
    @apps = App.all
    render json: @apps, each_serializer: AppSerializer, meta: { total: @apps.count }
  end

  def show
    render json: @app
  end

  def problem
  end

  private

  def set_app
    @app = App.find_by(id: params[:id])
    @app ||= App.find_or_initialize_by(slug: params[:id].parameterize)
  end
end
