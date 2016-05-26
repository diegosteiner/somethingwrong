# frozen_string_literal: true
class Problem < ApplicationRecord
  belongs_to :app

  validates :app, presence: true

  scope :unsolved, -> { where(solved_at: nil) }

  def solve
    update(solved_at: Time.zone.now)
  end

  def solved?
    solved_at.present?
  end
end
