require 'faker'

users = 10
surveys = 10
questions = 40
answers = 160

users.times do
  User.create(username: Faker::Internet.user_name, hashword: Faker::Internet.password, email: Faker::Internet.email )
end


surveys.times do |i|
  Survey.create(user_id: i, title: Faker::Lorem.sentence)
end


questions.times do |i|
   Question.create(survey_id: valid_survey_ids.sample, text: Faker::Lorem.sentence)
end

valid_questions_ids = (1..questions).to_a

answers.times do
  Answer.create(question_id: valid_questions_ids.sample, text: Faker::Lorem.sentence)
end

