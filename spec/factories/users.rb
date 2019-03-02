FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    sequence :password do |n|
      "passwordperson#{n}"
    end
    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end
    factory :premium do
      after(:create) { |user| user.add_role(:premium) }
    end
  end
end
