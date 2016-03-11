FactoryGirl.define do
  factory :app do
    name { Faker::Commerce.product_name }
  end
end
