class TrafficLight
  def change_to(state)
    @state = state
  end

  def signal
    case @state
    when "stop" then turn_on_lamp(:red)
    when "caution"
      turn_on_lamp(:yellow)
      ring_warning_bell
    when "proceed" then turn_on_lamp(:green)
    end
  end

  def next_state
    case @state
    when "stop" then "proceed"
    when "proceed" then "caution"
    when "cuation" then "stop"
    end
  end

  def turn_on_lamp(color)
    puts "Turning on the #{color} lamp"
  end

  def ring_warning_bell
    puts "Ring ring ring!"
  end
end
