class Answer < ActiveRecord::Base
  has_and_belongs_to_many :survey_takers, join_table: "answers_users", class_name: "User"
  belongs_to :question
end
