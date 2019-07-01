require 'date'

class Account
  STARTING_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize(opening_balance = STARTING_BALANCE)
    @balance = opening_balance
    @transactions = []
  end

  def deposit(amount, date =  Date.today)
    raise 'input must be a number' unless valid_number?(amount)

    @balance += amount
    @transactions.push([date, amount, nil, @balance])
  end

  def withdraw(amount, date = Date.today)
    raise 'input must be a number' unless valid_number?(amount)

    @balance -= amount
    @transactions.push([date, nil, amount, @balance])
  end

  def statement
    "date || credit || debit || balance
    #{statement_format}"
  end

private

  def valid_number?(amount)
    amount.is_a?(Numeric)
  end

  def statement_format
    statements = []
    @transactions.each { |item| statements.push("#{item[0]} || #{item[1]} || #{item[2]} || #{item[3]}\n") }
    statements.join
  end
end
