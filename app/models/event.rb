class Event < ApplicationRecord

  belongs_to :creator, class_name: "User"

  validates :name, :location, :event_time, :creator_id, presence: true
end
