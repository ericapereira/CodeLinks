class Message < ApplicationRecord
  validates  :content, length:  {maximum: 100}, presence:   true
  belongs_to :user


end
