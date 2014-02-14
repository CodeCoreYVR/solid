class UpdateOrder
  def perform(attributes)
    order = Order.new(attributes)
    if order.save
      order.ship
      order.mark_as_completed
    else
      return order.errors
    end
  end

  # Another developer comes and changes the code to use `create`.
  # Because `save` and `create` are similar right?`
  def updated_perform(attributes)
    order = Order.new
    if order.update_attributes(attributes)
      order.ship
      order.mark_as_completed
    else
      return order.errors
    end
  end
end

class Order < ActiveRecord::Base
  attr_accessor :save_attempts
  def save
    self.invoice_identifier += 1
    # we had problems with some records having duplicate invoice_ids.
    # We should rely on the database to check for uniqueness.
    unless @save_attempts < 5
      self.errors.add(:base, 'unable to set a unique invoice_identifier')
      return false
    end
    begin
      save!
    rescue Exception # most likely uniqueness error from database
      @save_attempts ||= 0
      @save_attempts += 1
      self.invoice_identifier += 1
      self.save # use recursive functions
    end
  end
end
