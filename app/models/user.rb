class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events

  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  def upcoming_events
    self.events.where("date > ?", Time.now)
  end

  def past_events
    self.events.where("date < ?", Time.now)
  end

end
