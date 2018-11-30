require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'title' do
    it 'should be presence'
    it 'not more than hundred character'
  end
  it 'is not valid without tag/tags'
  it 'is not valid without content'
end
