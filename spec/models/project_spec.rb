require 'rails_helper'

RSpec.describe Project, type: :model do

  let(:project) { FactoryGirl.create(:project_1) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:project_id) }
  end
end
