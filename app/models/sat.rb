# == Schema Information
#
# Table name: sats
#
#  id            :integer          not null, primary key
#  date          :date
#  address       :string
#  location_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  latitude      :float
#  longitude     :float
#

class Sat < ApplicationRecord
  has_many :events
  has_many :users, through: :events

  geocoded_by :address
  after_validation :geocode
end
