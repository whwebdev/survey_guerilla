class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  # Remember to create a migration!
end
