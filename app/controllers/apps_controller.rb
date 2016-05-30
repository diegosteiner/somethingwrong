# frozen_string_literal: true
class AppsController < ApplicationController
  before_action :set_app, only: [:show, :problem, :problems, :solution]
  before_action :authorize!

  def index
    @apps = App.all
    render json: @apps, each_serializer: AppSerializer, meta: { total: @apps.count }
  end

  def show
    render json: @app
  end

  def problems
    @problems = @app.problems.unsolved
    render json: @problems, each_serializer: ProblemSerializer, meta: { total: @problems.count }
  end

  def problem
    @problem = @app.problems.build(data: problem_params.to_h, source: params[:source])
    if @problem.save
      render json: @problem, serializer: ProblemSerializer
    else
      render json: { errors: @problem.errors }, status: 406
    end
  end

  def solution
    @app.solve_problems!
    render json: @app, serializer: AppSerializer
  end

  private

  def set_app
    @app = App.find_by(id: params[:id])
    @app ||= App.find_or_create_by(slug: params[:id]) { |app| app.name = app.slug }
  end

  def problem_params
    params.except(:action, :controller, :id).permit!
  end
end
