require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    reson = create(:user)
  end
  context "validates presence and length of various attributes for a new user" do
    before(:all) do
      naimutie = build(:user, name: "Naimutie", email: "safari.naimutie@gmail.com")
    end
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20) }
    it { should validate_presence_of(:email) }
  end

  context "validates uniqueness of the email attribute" do

    it "validates the uniqueness of an email address" do
      some_other_reson = build(:user)
      expect(some_other_reson).to_not be_valid
    end
  end
end
