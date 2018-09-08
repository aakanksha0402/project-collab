FactoryGirl.define do
  factory :project do
    name         { Faker::Lorem.word }
    status       :init
    project_id   { Faker::Number.number(5) }
    description  { Faker::Lorem.paragraph }
    association  :added_by, factory: :project_manager    
  end
end
