
class OrderCalculator
  def initialize(options = {})
    @fee_percentage = options[:fee_percentage]
    @fee_max = options[:fee_max]
    @fee_min = options[:fee_min]
    @country_tax_rate = options[:country_tax_rate]
    @local_tax_rate = options[:local_tax_rate]
    @item = options[:item]
    @in_oregon = options[:in_oregon]
  end

  def total_price
    @item.price + tax + fee
  end

  def tax
    tax = if @item.apply_state_tax?
      @item.price * @local_tax_rate
    else
      @item.price * @country_tax_rate
    end
  end

  def fee
    fee = @item.price * @fee_precentage
    if fee > @fee_max
      fee = @fee_max
    elsif fee < @fee_min
      fee = @fee_min
    end
  end
end

class Item < ActiveRecord::Base
  def apply_state_tax?
    case category
    when :clothing, :food, :minors
      false
    else
      true
    end
  end
end


# Caller
calc = OrderCalculator.new(
  fee_percentage: 0.025,
  fee_max: 50,
  fee_min: 1,
  country_tax_rate: 0.5,
  local_tax_rate: 0.1,
  item: Item.first
)
calc.total_price

