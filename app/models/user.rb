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



end
