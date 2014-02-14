class Communicative
  attr_accessor :value

  def perform_check(other)
    if self.value > other
      'steam'
    elsif self.value < other
      'vent'
    else
      'raise temperature'
    end
  end
end
