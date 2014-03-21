class Answer < ActiveRecord::Base
  has_and_belongs_to_many :users
  # Remember to create a migration!
end
