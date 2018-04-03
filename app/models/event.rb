class Event < ApplicationRecord
  belongs_to :place
  has_many :tickets

  validates :start_date, presence: true
  validate :start_date_must_be_after_today
  validate :no_more_than_one_event_same_place_same_time
end

def start_date_must_be_after_today
  if start_date < Date.today
    errors.add(:start_date, "can't be in the past")
  end
end

def no_more_than_one_event_same_place_same_time
  puts(Event.where(place: place_id,start_date: start_date).length)
  if Event.where(place: place_id,start_date: start_date).length>0
    errors.add(:start_date, "can't make more than one event at the same place at the same time")
  end
end