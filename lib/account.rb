class Account
  STARTING_BALANCE = 0

  attr_reader :balance

  def initialize(opening_balance = STARTING_BALANCE)
    @balance = opening_balance
  end

  def show_balance
    @balance
  end

  def deposit(amount)
    raise 'input must be a number' if !amount.is_a?(Numeric)
    @balance += amount
  end
end
