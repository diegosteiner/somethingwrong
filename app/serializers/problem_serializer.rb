class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :app_id, :data, :solved, :solved_at

  def solved
    object.solved?
  end
end
