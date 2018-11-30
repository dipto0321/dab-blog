FactoryBot.define do
  factory :post do
    user { nil }
    title { "MyString" }
    tag { "MyString" }
    content { "" }
  end
end
