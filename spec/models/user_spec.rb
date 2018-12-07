require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new( fullname:'John Doe',
                                 username: 'john01',
                                 email: 'john@demo.com',
                                 password: 'Pas$0wrd') }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a fullname" do
    subject.fullname = nil
    expect(subject).to_not be_valid
  end

  describe 'username' do
    it 'should be presence' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it 'maximum length should be fifty chars' do
      subject.username = 'a' * 51
      expect(subject).to_not be_valid
    end
    it { should validate_uniqueness_of(:username) }
  end
  
  describe 'email' do
    it 'should be presence' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'maximum length should be 255 chars' do
      subject.email = "#{'a' * 255}@demo.com"
      expect(subject).to_not be_valid
    end

    it 'formate should be valid' do
      subject.email = "john@"
      expect(subject).to_not be_valid
    end

    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'password' do
    it "should be presence" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without minimum six characters" do
      subject.password = 'Pa$0'
      expect(subject).to_not be_valid
    end
    it "is not valid without atleast one capital letter, small letter,number, and special character" do
      subject.password = 'password'
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end
end
