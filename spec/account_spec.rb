require 'account'

describe Account do
  subject = described_class.new

  describe '#show_balance' do
    it "shows the current balance in the account" do
      expect(subject.show_balance).to eq(0)
    end
  end
end
