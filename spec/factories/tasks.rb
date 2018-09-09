FactoryGirl.define do
  factory :task do
    name         { Faker::Lorem.word }
    status       :init
    description  { Faker::Lorem.paragraph }

    association  :project, factory: :project_1
    association  :user, factory: :developer
  end
end
