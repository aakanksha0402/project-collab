require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:project_manager) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:role) }
  end

  describe "associations" do
    it { expect(user).to have_many :added_projects }
    it { expect(user).to have_many :project_users }
    it { expect(user).to have_many :projects }
    it { expect(user).to have_many :added_projects }
    it { expect(user).to have_many :tasks }
  end
end
