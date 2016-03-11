class App < ApplicationRecord
  validates :slug, presence: true, uniqueness: true

  before_validation { self.slug = name.parameterize }

  def to_param
    slug || super
  end
end
