FactoryBot.define do
  factory :entity do
    name { 'Nico' }
    amount { 100.0 }
    user
    group
  end
end
