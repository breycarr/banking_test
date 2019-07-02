require 'account'

describe 'acceptance criteria' do
  let(:subject) { Account.new }

  it 'meets the acceptance criteria provided' do
    subject.deposit(1000, "10/01/2012")
    subject.deposit(2000, "13/01/2012")
    subject.withdraw(500, "14/01/2012")
    expect(subject.statement).to eq(
      "date || credit || debit || balance\n14/01/2012 ||  || 500 || 2500\n13/01/2012 || 2000 ||  || 3000\n10/01/2012 || 1000 ||  || 1000\n"
    )
  end
end
