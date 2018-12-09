# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, presence: true, length: { maximum: 100 }
  validates :tag, presence: true
  validates :content, presence: true
end
