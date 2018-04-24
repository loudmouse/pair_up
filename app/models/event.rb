class Event < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: 'user_id'

  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  def self.future_events
    Event.where("date > ?", Time.now)
  end

  def self.old_events
    Event.where("date < ?", Time.now)
  end
end
