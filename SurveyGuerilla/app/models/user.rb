class User < ActiveRecord::Base
  has_and_belongs_to_many :surveys
  has_and_belongs_to_many :answers

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
    self.password == password
  end
end
