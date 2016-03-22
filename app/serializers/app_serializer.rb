class AppSerializer < ActiveModel::Serializer
  attributes :id, :name, :ok

  def ok
    object.ok?
  end

  link(:problem) { Rails.application.routes.url_helpers.problem_app_url(object, only_path: true) }
  link(:solution) { Rails.application.routes.url_helpers.solution_app_url(object, only_path: true) }
  link(:self) { Rails.application.routes.url_helpers.app_url(object, only_path: true) }
end
