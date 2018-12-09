# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user1).to be_valid
  end

  it { should validate_presence_of(:fullname) }

  describe 'username' do
    it { should validate_presence_of(:username) }

    it 'maximum length should be fifty chars' do
      user2 = build(:user, username: 'a' * 51)
      expect(user2).to_not be_valid
    end
    it { should validate_uniqueness_of(:username) }
  end

  describe 'email' do
    it { should validate_presence_of(:email) }

    it 'maximum length should be 255 chars' do
      user2 = build(:user, email: "#{'a' * 255}@demo.com")
      expect(user2).to_not be_valid
    end

    it 'formate should be valid' do
      user2 = build(:user, email: 'john@')
      expect(user2).to_not be_valid
    end

    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'password' do
    it { should validate_presence_of(:password) }

    it 'is not valid without minimum six characters' do
      user2 = build(:user, password: 'Pa$0')
      expect(user2).to_not be_valid
    end
    it 'not valid without strong password' do
      user2 = build(:user, password: 'password')
      expect(user2).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end
end
