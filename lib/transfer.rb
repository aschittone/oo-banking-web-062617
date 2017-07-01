class Transfer
	attr_accessor :receiver, :sender, :status, :amount
  def initialize(sender, receiver, amount)
  	@receiver = receiver
  	@sender = sender
  	@amount = amount
  	@status = "pending"
  end

  def valid?
  	sender.valid? && receiver.valid?
  end

  def execute_transaction
  	if valid? && sender.balance > @amount && self.status == "pending"
	  	receiver.balance += @amount
	  	sender.balance -= @amount
	  	self.status = "complete"
	 else 
	 	self.status = "rejected"
  		return "Transaction rejected. Please check your account balance."
	end
  end

  def reverse_transfer
  	if receiver.balance > @amount && valid? && self.status == "complete"
	  	receiver.balance -= @amount
	  	sender.balance += @amount
	  	self.status = "reversed"
	 else 
	 	self.status = "rejected"
  		return "Transaction rejected. Please check your account balance."
	end
  end

end
