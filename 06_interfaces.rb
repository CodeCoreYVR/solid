# Two types of interfaces
#  * single class / class chain
#  * multiple classes / ruby modules
class CleaningItem
  def clean
    puts "#{item_name} was cleaned"
  end

  def item_name
    raise "must implement item_name"
  end
end

class Carpet < CleaningItem
  def item_name
    "carpet"
  end
end

class Couch < CleaningItem
  def item_name
    "couch"
  end
end

class Chair < CleaningItem
  def item_name
    "chair"
  end
end
