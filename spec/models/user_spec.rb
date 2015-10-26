require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :model do

  describe "password encryption" do
    it "does not save passwords to the database" do
      user = User.new(username: "ginger_baker", password: "abcdef")
      user.save
      expect(User.first.password).to be_nil
    end
  end

  it "encrypts the password using BCrypt" do
    expect(BCrypt::Password).to receive(:create)
    user = User.new(username: "Fred", password: "password")
  end
end
