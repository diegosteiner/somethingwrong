FactoryGirl.define do
  factory :problem do
    data { { key: :value } }
    source { Faker::Internet.url }
  end
end
