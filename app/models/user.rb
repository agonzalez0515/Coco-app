class User < ApplicationRecord
  has_secure_password

  has_many :chats
  has_many :comments
  has_many :events
  has_many :messages
  has_many :requirements
  has_many :sats, through: :events

  validates_presence_of :user_type, :email, :first_name, :last_name, :password_digest, 
  											:phone_number, :street_address, :city, :state, :zip_code,
  											:lang_preference, :grade_level
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
