require 'faker'

users = 10
surveys = 10
questions = 40
answers = 160

users.times do
  User.create(username: Faker::Internet.user_name, hashword: Faker::Internet.password, email: Faker::Internet.email )
end

surveys.times do |i|
  Survey.create(creator_id: i+1, title: Faker::Lorem.sentence)
end


Survey.all.each do |s|
   Question.create(survey_id: s.id, text: "survey #{s.id} question 1")
   Question.create(survey_id: s.id, text: "survey #{s.id} question 2")
   Question.create(survey_id: s.id, text: "survey #{s.id} question 3")
   Question.create(survey_id: s.id, text: "survey #{s.id} question 4")
end

Question.all.each do |q|
   Answer.create(question_id: q.id, text: "question #{q.id} answer 1")
   Answer.create(question_id: q.id, text: "question #{q.id} answer 2")
   Answer.create(question_id: q.id, text: "question #{q.id} answer 3")
   Answer.create(question_id: q.id, text: "question #{q.id} answer 4")
end


# seed associations
# User.all.each do |user|
#   Answer.all.each_slice(4) do |four_answers|
#     user.chosen_answers << four_answers.sample
#   end
# end
