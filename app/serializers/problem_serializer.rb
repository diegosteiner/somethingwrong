# frozen_string_literal: true
class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :app_id, :data, :solved, :solved_at, :source
  has_one :app

  def solved
    object.solved?
  end
end
