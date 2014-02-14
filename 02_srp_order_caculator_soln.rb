class FeeCalculator

  def initialize(options)
    @fee_percentage = options[:fee_percentage]
    @fee_max = options[:fee_max]
    @fee_min = options[:fee_min]
  end

  def calculate(item_price)
    fee = item_price * @fee_precentage

    if fee > @fee_max
      @fee_max
    elsif fee < @fee_min
      @fee_min
    else
      fee
    end
  end
end

class TaxCalculator
  attr_accessor :country_rate, :local_rate
  def initialize(options)
    @country_rate = options[:country_tax_rate]
    @local_rate = options[:local_tax_rate]
  end

  def calculate(item_price, item_category)
    item_price * applicable_rate(item_category)
  end

  def applicable_rate(item_category)
    apply_local_tax?(item_category) ? local_rate : country_rate
  end

  def apply_local_tax?(item_category)
    case item_category
    when :clothing, :food, :minors
      false
    else
      true
    end
  end
end

class OrderCalculator

  def initialize(options = {})
    @fee_calculator = options[:fee_calculator]
    @tax_calculator = options[:tax_calculator]
    @item = options[:item]
  end

  def total_price
    @item.price +
      tax_calculator.calculate(@item.price, @item.category) +
      fee_calculator.calculate(@item.price)
  end
end

# Caller
calc = OrderCalculator.new({
  fee_calculator: FeeCalculator.new({
    fee_percentage: 0.025,
    fee_max: 50,
    fee_min: 1
  }),
  tax_calculator: TaxCaculator.new({
    country_tax_rate: 0.5,
    local_tax_rate: 0.1
  }),
  item: Item.first
})
calc.total_price

# SWAP IN OTHER CALCULATORS
