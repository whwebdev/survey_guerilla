class User < ActiveRecord::Base
  has_and_belongs_to_many :taken_surveys, join_table: "surveys_users", class_name: "Survey"
  has_and_belongs_to_many :chosen_answers, join_table: "answers_users", class_name: "Answer"

  has_many :created_surveys, class_name: "Survey",
                             foreign_key: "creator_id"
  include BCrypt
  validates :username, uniqueness: true

  def password
    Password.new(self.hashword)
  end

  def password=(new_password)
    password = Password.create(new_password)
    self.hashword = password
  end

  def authenticate(password)
    p password
    self.password == password
  end
end
