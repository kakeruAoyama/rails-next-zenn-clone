require "rails_helper"

RSpec.describe User, type: :model do
  describe "Factory defaults" do
    subject(:user) { create(:user) }

    it "is valid and confirmed" do
      expect(user).to be_valid
      expect(user).to be_confirmed
    end
  end
end
