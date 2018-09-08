require 'rails_helper'

RSpec.describe ProjectUser, type: :model do
  let(:project_user) { FactoryGirl.create(:project_user) }

  describe "validations" do
  end

  describe "associations" do
    it { expect(project_user).to belong_to :project }
    it { expect(project_user).to belong_to :user }
  end

end
