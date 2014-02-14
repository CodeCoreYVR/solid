# Exercise
#  - Refactor this code so it satisfies the single responsibility principle
#
# Let's talk about the different types of dependencies that got introduced.
#  * class name, method name, params (order/names), return type
class MeetingHall
  attr_accessor :table_count, :table_width, :table_height
  attr_accessor :width, :length

  def initialize(table_count, table_width, table_height, width, length)
    self.table_count = table_count
    self.table_width = table_width
    self.table_height = table_height
    self.width = width
    self.length = length
  end

  def extra_space
    width * length - (table_count * table_width * table_length)
  end
end
