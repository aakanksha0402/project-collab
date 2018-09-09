FactoryGirl.define do
  factory :user do
    email         { Faker::Internet.email }
    password      { Faker::Internet.password }
  end

  factory :project_manager, parent: :user do
    role         "project_manager"
  end

  factory :developer, parent: :user do
    role         "developer"
  end
end
