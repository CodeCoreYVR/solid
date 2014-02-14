class Attendance < ActiveRecord::Base
  has_one :event
  has_one :user

  after_create :send_invite_to_user

  attr_accessor :admin_updating

  # if it's the user updating then ensure they can see the event
  # if it's the admin then doesn't matter
  validates :user_can_see_event, unless: :admin_updating

  def date
    event.date
  end

  protected

  def send_invite_to_user
    UserMailer.invite(self).deliver
  end

end


# LAW OF DEMETER
attendance.event.date

attendance.date
