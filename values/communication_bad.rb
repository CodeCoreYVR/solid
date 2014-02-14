class Uncommunicative
  attr_accessor :value

  def perform_check(other_value)
    (self.value <=> other_value) > 0 ? 'steam' : (self.value <=> other_value < 0) ? 'vent' : 'raise temperature'
  end
end
