require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it { should belong_to(:commentable) }
    it { should have_many(:comments) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:comment) }
  end
end
