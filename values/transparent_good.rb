class UpdateOrder
  def perform(attributes)
    order = Order.new(attributes)
    if order.save_with_unique_invoice_identifier
      order.ship
      order.mark_as_completed
    else
      return order.errors
    end
  end
end

class Order < ActiveRecord::Base
  attr_accessor :save_attempts

  def save_with_unique_invoice_identifier
    # we had problems with some records having duplicate invoice_ids.
    # We should rely on the database to check for uniqueness.
    @save_attempts = 0
    while @save_attempts < 5 do
      begin
        save!
        return true
      rescue ActiveRecord::RecordNotUnique
        self.invoice_identifier = generate_new_invoice_identifier
        @save_attempts += 1
      end
    end

    self.errors.add(:base, 'unable to set a unique invoice_identifier')
    false
  end


  def generate_new_invoice_identifier
    invoice_identifier + 1
  end
end
