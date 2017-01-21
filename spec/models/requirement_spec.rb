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

require 'rails_helper'

RSpec.describe Requirement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
