require 'rails_helper'

RSpec.describe User, type: :model do
  context "validates presence and length of various attributes for a new user" do
    before(:all) do
      reson = build(:user)
    end
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20) }
    it { should validate_presence_of(:email) }
  end
end
