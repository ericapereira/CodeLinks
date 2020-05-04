class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  VALIDATE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,  presence:   true,   length: {maximum:  150},
  uniqueness:  {case_sensitive:  false}
  has_secure_password
  validates   :password, length: {minimum:  8}
  has_many :posts
  has_many :comments

  acts_as_messageable

end
