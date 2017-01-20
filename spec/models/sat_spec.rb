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

require 'rails_helper'

RSpec.describe Sat, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
