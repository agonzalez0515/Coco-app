# == Schema Information
#
# Table name: tips
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tip < ApplicationRecord
end
