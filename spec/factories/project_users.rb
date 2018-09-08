FactoryGirl.define do
  factory :project_user do
    association  :user,  factory: :developer
    association  :project
  end
end
