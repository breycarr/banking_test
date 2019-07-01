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
    raise 'input must be a number' unless valid_number?(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'input must be a number' unless valid_number?(amount)
    @balance -= amount
  end

private

  def valid_number?(amount)
     amount.is_a?(Numeric)
  end
end
