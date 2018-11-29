require 'rails_helper'

RSpec.describe User, type: :model do
  subject {described_class.new}
  it "is valid with valid attributes" do
    subject.fullname = 'John Doe'
    subject.username = 'john01'
    subject.email = 'john@demo.com'
    subject.password = 'pa$$0rd'
    expect(subject).to be_valid
  end

  it "is not valid without a fullname" do
    user = User.new(fullname: nil)
    expect(user).to_not be_valid
  end
  it "is not valid without a username"
  it "should have a uniqe username"
  it "is not valid without a email"
  it "should have a uniqe email"
  it "is not valid without a password"
  describe 'password' do
    it "is not valid without minimum six characters"
    it "is not valid without atleast one number and special character"
  end
end
