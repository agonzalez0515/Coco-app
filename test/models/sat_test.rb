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

require 'test_helper'

class SatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
