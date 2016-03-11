class App < ApplicationRecord
  has_many :problems, dependent: :destroy
  validates :slug, presence: true, uniqueness: true

  before_validation { self.slug = name.parameterize }

  def ok?
    problems.unsolved.none?
  end

  def to_param
    slug || super
  end
end
