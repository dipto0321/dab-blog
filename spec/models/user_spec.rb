require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }
  it "is valid with valid attributes" do
    subject.fullname = 'John Doe'
    subject.username = 'john01'
    subject.email = 'john@demo.com'
    subject.password = 'Pas$0rd'
    expect(subject).to be_valid
  end

  it "is not valid without a fullname" do
    expect(subject).to_not be_valid
  end

  describe 'username' do
    it 'should be presence' do
      subject.fullname = 'John Doe'
      expect(subject).to_not be_valid
    end

    it 'maximum length should be fifty chars' do
      subject.fullname = 'John Doe'
      subject.username = 'a' * 51
      expect(subject).to_not be_valid
    end
    it 'should be uniqe'
  end
  
  describe 'email' do
    it 'should be presence' do
      subject.fullname = 'John Doe'
      subject.username = 'john01'
      expect(subject).to_not be_valid
    end

    it 'maximum length should be 255 chars' do
      subject.fullname = 'John Doe'
      subject.username = 'john01'
      subject.email = "#{'a' * 255}@demo.com"
      expect(subject).to_not be_valid
    end

    it 'formate should be valid' do
      subject.fullname = 'John Doe'
      subject.username = 'john01'
      subject.email = "john@"
      expect(subject).to_not be_valid
    end

    it 'should be uniqe'
  end

  describe 'password' do
    it "should be presence" do
      subject.fullname = 'John Doe'
      subject.username = 'john01'
      subject.email = 'john@demo.com'
      expect(subject).to_not be_valid
    end
    it "is not valid without minimum six characters" do
      subject.fullname = 'John Doe'
      subject.username = 'john01'
      subject.email = 'john@demo.com'
      subject.password = 'Pa$0'
      expect(subject).to_not be_valid
    end
    it "is not valid without atleast one capital letter, small letter,number, and special character" do
      subject.fullname = 'John Doe'
      subject.username = 'john01'
      subject.email = 'john@demo.com'
      subject.password = 'password'
      expect(subject).to_not be_valid
    end
  end
end
