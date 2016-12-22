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


  validates_presence_of :date
  validates_presence_of :address
  validates_presence_of :location_name


  # geocoded_by :address
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

end
