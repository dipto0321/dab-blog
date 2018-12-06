FactoryBot.define do
  factory :comment do
    user { nil }
    comment { "MyText" }
    post { nil }
  end
end
