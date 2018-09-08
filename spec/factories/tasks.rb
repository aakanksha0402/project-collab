FactoryGirl.define do
  factory :task do
    name         { Faker::Lorem.word }
    status       :init
    description  { Faker::Lorem.paragraph }
    association  :project
    association  :user, factory: :developer
  end
end
