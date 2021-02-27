require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    ramsey = create(:user)
  end

  it { should validate_presence_of(:name) }
end
