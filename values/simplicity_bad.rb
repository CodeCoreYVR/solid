require 'active_model'

class FlexibleDinner
  include Family
  define_model_callbacks :cook
  after_cook :notify_family
  after_prepare :notify_family

  def cook
    # prepare and cook the meal
  end

  def prepare

  end

  def serve

  end

end

class FlexibleBreakfast
  include Family
  define_model_callbacks :make
  after_make :notify_family

  def make
    # make breakfast
  end
end

# Family module that can be included in any class that will autmoatically
# notify the family members about events
module Family
  extend ActiveRecord::Concerns
  included do
    extend ActiveModel::Callbacks
  end

  def notify_family
    # send e-mails, text message, and dispatch the family robot
    # to gather the family together
  end

end
