class Topic < ApplicationRecord
  belongs_to :message

  validates_presence_of :title
  validates_presence_of :message_id
end
