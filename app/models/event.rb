class Event < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: 'user_id'

  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  scope :future_events, -> { where("date > ?", Time.now) } #scope: can now use future_events method
  scope :old_events, -> { where("date < ?", Time.now) } #scope: can now use old_events method

  ## Refacotoring the below class methods into scopes above

  # def self.future_events
  #   Event.where("date > ?", Time.now)
  # end

  # def self.old_events
  #   Event.where("date < ?", Time.now)
  # end


end
