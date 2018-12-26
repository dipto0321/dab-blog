FactoryBot.define do
  factory :relationship do
    user { nil }
    following_id { 1 }
    follower_id { 1 }
    friend_id { 1 }
  end
end
