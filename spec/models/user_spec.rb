require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many :favorites }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should have_secure_password }

    it "generates a unique api key before create" do
      user = User.new(
        name: "Joey",
        email: "joeydoesgood@gmailjoey.com",
        password: "Joey",
        password_confirmation: "Joey",
      )

      user.save

      expect(user.api_key).to_not be_nil
    end
  end
end
