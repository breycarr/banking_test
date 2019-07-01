require 'account'

describe Account do
  subject = described_class.new

  describe '#show_balance' do
    it "shows the current balance in the account" do
      expect(subject.show_balance).to eq(0)
    end
  end

  describe '#deposit' do
    it "accepts a nunber and increase the balance by that amount" do
      expect{ subject.deposit(1) }.to change{ subject.show_balance }.by(1)
    end
    it "should throw an error if the input is not a number" do
      expect{ subject.deposit('one') }.to raise_error('input must be a number')
    end
  end

  describe '#withdraw' do
    it "accepts a number and decreases the balance by that amount" do
      expect{ subject.withdraw(1) }.to change{ subject.show_balance }.by(-1)
    end
    it "should throw an error if the input is not a number" do
      expect{ subject.withdraw('one') }.to raise_error('input must be a number')
    end
  end
end
