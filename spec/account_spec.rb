require 'account'

describe Account do
  let(:subject) { described_class.new }

  describe '#show_balance' do
    it "shows the current balance in the account" do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it "accepts a nunber and increase the balance by that amount" do
      expect { subject.deposit(1) }.to change { subject.balance }.by(1)
      p subject.transactions
    end
    it "should throw an error if the input is not a number" do
      expect { subject.deposit('one') }.to raise_error('input must be a number')
    end
  end

  describe '#withdraw' do
    it "accepts a number and decreases the balance by that amount" do
      expect { subject.withdraw(1) }.to change { subject.balance }.by(-1)
    end
    it "should throw an error if the input is not a number" do
      expect { subject.withdraw('one') }.to raise_error('input must be a number')
    end
  end

  describe '#statement' do
    it "prints a formatted statement of their account" do
      expect(subject.statement).to include("date || credit || debit || balance")
    end
    it "prints out a deposit in column 2" do
      subject.deposit(1)
      expect(subject.statement).to include("|| 1 ||  || 1")
    end
    it 'prints out a withdrawl in column 3' do
      subject.deposit(10)
      subject.withdraw(1)
      expect(subject.statement).to include("||  || 1 || 9")
    end
    it "includes the date" do
      subject.deposit("10/01/2012", 1000)
      expect(subject.statement).to include("10/01/2012 || 1000 ||  || 1000")
    end
  end
end
