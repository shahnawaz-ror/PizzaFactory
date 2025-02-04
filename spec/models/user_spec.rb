require 'rails_helper'

RSpec.describe User, type: :model do
  describe "enums" do
    it "defines roles correctly" do
      expect(User.roles).to eq({ "customer" => 0, "admin" => 1, "vendor" => 2 })
    end

    it "allows setting and getting roles" do
      user = User.new(email: "test@example.com", password: "password", role: :admin)
      expect(user.admin?).to be true
      expect(user.customer?).to be false
    end
  end
end
