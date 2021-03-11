require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @reson = create(:user)
    @naimutie = create(:user)
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
      some_other_reson = build(:user, name: @reson.name, email: @reson.email)
      expect(some_other_reson).to_not be_valid
    end
  end

  context "can send friendship requests" do
    it "can send friend requests to other users" do
      expect { @reson.send_friendship_request(@naimutie) }.to change { Friendship.count }
    end

    it "checks to see that the new friendship has a status of false" do
      friendship = Friendship.find_by user: @reson, friend: @naimutie
      expect { friendship.status.to be false }
    end

    it "cannot send friend requests to self" do
      
    end
  end
end
