# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(fullname: 'John Doe', username: 'john01', email: 'john01@email.com', password: 'Pas$s0rd', password_confirmation: 'Pas$s0rd') }
  subject { described_class.new(title: 'This is a title', tag: 'test', content: 'This ia a conent', user: user) }

  describe 'title' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'should be presence' do
      subject.title = nil
      expect(subject).not_to be_valid
    end
    it 'not more than hundred character' do
      subject.title = 'a' * 105
      expect(subject).not_to be_valid
    end
  end
  it 'is not valid without tag/tags' do
    subject.tag = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without content' do
    subject.content = nil
    expect(subject).not_to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end
end
