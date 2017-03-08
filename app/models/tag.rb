# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  title      :string
#  message_id :integer
#  count      :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  belongs_to :message

  validates_presence_of :title
  validates_presence_of :message_id
end
