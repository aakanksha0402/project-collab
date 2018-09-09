FactoryGirl.define do
  factory :project do
    status       :init
    project_id   { Faker::Number.number(5) }
    description  { Faker::Lorem.paragraph }
    association  :added_by, factory: :project_manager
  end

  factory :project_1, parent: :project do
    name         { Faker::Lorem.word }
  end

  factory :project_2, parent: :project do
    name         { Faker::Lorem.word }
  end
end
