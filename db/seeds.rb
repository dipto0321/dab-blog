# frozen_string_literal: true

30.times do
  fullname = Faker::Name.name
  username = fullname.split(' ')[0] + (0..9).to_a.sample(4).join
  email =  "#{username}@demomail.com"
  password = 'Pas$w0rd'
  password_confirmation = 'Pas$w0rd'
  User.create!(fullname: fullname, username: username, email: email, password: password, password_confirmation: password_confirmation)
end

users = User.take(10)

20.times do
  title = Faker::Lorem.sentence(4)
  tag = Faker::Lorem.word
  content = Faker::Lorem.paragraphs(5)
  users.each { |user| user.posts.create!(title: title, tag: tag, content: content) }
end
