FactoryBot.define do
  factory :group do
    user
    sequence(:name) { |n| "Cat #{n}" }

  end
end