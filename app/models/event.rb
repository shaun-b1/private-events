class Event < ApplicationRecord

  has_many :event_attendings, foreign_key: "attended_event_id"
  has_many :attendees, through: :event_attendings, source: :attendee
  belongs_to :creator, class_name: "User"

  validates :name, :location, :event_time, :creator_id, presence: true

  scope :past_event, -> { where('event_time < ?', DateTime.now) }
  scope :upcoming_event, -> { where('event_time >= ?', DateTime.now) }
end
