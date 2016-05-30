# frozen_string_literal: true
FactoryGirl.define do
  factory :app do
    name { Faker::Commerce.product_name }
    slug { name.parameterize.to_s }
  end
end
