require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { FactoryGirl.create(:task) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "associations" do
    it { expect(task).to belong_to :project }
    it { expect(task).to belong_to :user }
  end
end
