# Exercise:
#   Reduce the dependencies in this code
#
# Discuss:
#   Standardizing Interfaces, Sharing Code

class Cleaner
  attr_accessor :items

  def clean
    puts 'cleaning'
    items.each do |item|
      case item
      when Carpet
        item.steam
      when Couch
        item.vacuum
      when Chair
        item.wipe
      end
    end
  end

end

class Carpet
  def steam
    puts "carpet steamed"
  end
end

class Couch
  def vacuum
    puts "couch cleaned"
  end
end

class Chair
  def wipe
    puts "chair cleaned"
  end
end

cleaner = Cleaner.new
cleaner.items = [Carpet.new, Couch.new, Chair.new]
cleaner.clean

