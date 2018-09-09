FactoryGirl.define do
  factory :project_user do
    association  :user,  factory: :developer
    association  :project,  factory: :project_1
  end
end
