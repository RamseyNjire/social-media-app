require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before(:all) do
    friendship = build(:friendship)
  end

  it { should belong_to(:user) }
  it { should belong_to(:friend) }
end
