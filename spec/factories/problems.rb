# frozen_string_literal: true
FactoryGirl.define do
  factory :problem do
    data { { key: :value } }
    source { Faker::Internet.url }

    factory :solved_problem do
      solved_at { 1.day.ago }
    end
  end
end
