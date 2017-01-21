# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  user_type       :string
#  email           :string
#  password_digest :string
#  phone_number    :string
#  street_address  :string
#  city            :string
#  state           :string
#  zip_code        :integer
#  lang_preference :string
#  grade_level     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

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
  											:lang_preference
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_format_of :phone_number, :with => /\b\d{10}\b/, message: "must include area code and no symbols (i.e. 4151234567)", :on => :create

end
