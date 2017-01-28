class User < ApplicationRecord
  has_many :owned_events, class_name: 'Event'
  has_and_belongs_to_many :events
  has_and_belongs_to_many :timeslots
  validates :email, presence: true, length: { maximum: 255 }
end
