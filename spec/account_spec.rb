require 'account'

describe Account do
  subject = described_class.new

  describe '#show_balance' do
    it "shows the current balance in the account" do
      expect(subject.show_balance).to eq(0)
    end
  end

  describe '#deposit' do
    it "accepts an integer and increase the shown balance by that amount" do
      expect{ subject.deposit(1) }.to change{ subject.show_balance }.by(1)
    end
  end
end
