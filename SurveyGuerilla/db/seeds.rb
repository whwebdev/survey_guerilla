require 'faker'

10.times do
  User.create(username: Faker::Internet.user_name, password: "1234")
end







