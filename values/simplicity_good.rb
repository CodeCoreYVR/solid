class SimpleFamily

  def self.notify
    # send e-mails, text message, and dispatch the family robot
    # to gather the family together
  end

end
class SimpleDinner

  def cook
    # prepare and cook the meal
    SimpleFamily.notify
  end

  def prepare
    SimpleFamily.notify
  end

end

class SimpleBreakfast

  def make
    # make breakfast

    SimpleFamily.notify
  end
end

