class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    # if (sender.valid? == true) && (receiver.valid? == true)
    #   true
    # else
    #   false
    # end
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
