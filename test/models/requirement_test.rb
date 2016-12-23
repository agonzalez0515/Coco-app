# == Schema Information
#
# Table name: requirements
#
#  id             :integer          not null, primary key
#  subject        :string
#  years          :float
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  years_required :float
#

require 'test_helper'

class RequirementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
