class User < ApplicationRecord
  has_secure_password

  has_many :chats
  has_many :comments
  has_many :events
  has_many :messages
  has_many :requirements
  has_many :sats, through: :events

end
