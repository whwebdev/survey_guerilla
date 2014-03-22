class Survey < ActiveRecord::Base
  has_and_belongs_to_many :survey_takers, join_table: "surveys_users", class_name: "User"
  belongs_to :creator, class_name: "User"
  has_many :questions

end
