# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  sat_id     :integer
#  completed  :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           default("SAT Day")
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
