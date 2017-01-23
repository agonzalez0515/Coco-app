# == Schema Information
#
# Table name: tips
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tip, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
