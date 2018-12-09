# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    fullname { Faker::Name.name }
    username { fullname.split(' ')[0] + (0..9).to_a.sample(4).join }
    email { "#{username}@demomail.com" }
    password { 'Pas$0rd' }
    password_confirmation { 'Pas$0rd' }
  end
end
