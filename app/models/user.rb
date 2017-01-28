class User < ApplicationRecord

  # Michael Hartl's email matching regex -- thanks!
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :owned_events, class_name: 'Event'
  has_and_belongs_to_many :events
  has_and_belongs_to_many :timeslots

  validates :email,
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  before_save { email.downcase! }

  has_secure_password

end
