class Account
  STARTING_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize(opening_balance = STARTING_BALANCE)
    @balance = opening_balance
    @transactions = []
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise 'input must be a number' unless valid_number?(amount)

    @balance += amount
    @transactions.push([date, amount, nil, @balance])
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise 'input must be a number' unless valid_number?(amount)

    @balance -= amount
    @transactions.push([date, nil, amount, @balance])
  end

  def statement
    "date || credit || debit || balance\n#{format_transactions}"
  end

private

  def valid_number?(amount)
    amount.is_a?(Numeric)
  end

  def format_transactions
    statements = []
    @transactions.reverse.each {
      |item| statements.push(
        "#{item[0]} || #{add_pence(item[1])} || #{add_pence(item[2])} || #{add_pence(item[3])}\n"
      )
    }
    statements.join
  end

  def add_pence(item)
    valid_number?(item) ? "#{item}.00" : nil
  end

end
