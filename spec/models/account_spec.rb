require 'rails_helper'
require_relative '../../app/models/account'

describe Account do 
	before do
		@steve = Account.create!(name:"steve")
		@liz = Account.create!(name:"liz")
		@justin = Account.create!(name:"justin")
		@bob = Account.create!(name:"bob")

		@loan1 = Loan.create!(creditor: @steve, debtor: @liz, amount: 100.00)
		@loan2 = Loan.create!(creditor: @steve, debtor: @liz, amount: 80.00)
		@loan3 = Loan.create!(creditor: @liz, debtor: @steve, amount: 90.00)
		@loan4 = Loan.create!(creditor: @liz, debtor: @steve, amount: 200.00)
		@loan5 = Loan.create!(creditor: @justin, debtor: @steve, amount: 300.00)
		@loan6 = Loan.create!(creditor: @justin, debtor: @steve, amount: 450.00)
		@loan7 = Loan.create!(creditor: @steve, debtor: @justin, amount: 230.00)
		@loan8 = Loan.create!(creditor: @steve, debtor: @justin, amount: 120.00)
		@loan9 = Loan.create!(creditor: @steve, debtor: @bob, amount: 100.00)
		@loan10 = Loan.create!(creditor: @bob, debtor: @steve, amount: 99.00)

		@account_ids = [@liz.id, @justin.id]

	end


	describe '#sum_debits' do 
		it "returns an account's total debits across all accounts" do 
			expect(@steve.sum_debits).to eq(630)
		end

		it "returns an account's debits across asked accounts" do 
			expect(@steve.sum_debits(@account_ids)).to eq(530)
		end

		it "does not count private loans" do 
			@ploan1 = Loan.create!(creditor:@steve, debtor:@liz, amount:1000.00, private_debt:true)
			expect(@steve.sum_debits).to eq(630)
		end
		# it "asks #debits_with if passed an array" do 
		# 	expect(Account).to receive(:debits_with).with(@account_ids)

		# 	@steve.debits(@account_ids)
		# end
	end

	describe '#sum_credits' do 
		it "returns an account's total credits across all accounts" do 
			expect(@steve.sum_credits).to eq(1139)
		end

		it "does not count private loans" do 
			@ploan1 = Loan.create!(creditor:@liz, debtor:@steve, amount:1000.00, private_debt:true)
			expect(@steve.sum_credits).to eq(1139)
		end

		# it "asks #credits_with if passed an array" do 
		# 	expect(Account).to receive(:credits_with).with(@account_ids)

		# 	@steve.credits(@account_ids)
		# end

		it "returns an account's credits across asked accounts" do 
			expect(@steve.sum_credits(@account_ids)).to eq(1040)
		end
	end

		
	describe '#balance' do 
		it "returns an account's net balance across all accounts, if passed no accounts" do 
			expect(@steve.balance).to eq(-509)
		end

		it "returns an account's net balance across some accounts, if passed accounts" do 
			expect(@steve.balance(@account_ids)).to eq(-510)
		end
	end

	describe '#credits_with' do 
		it "returns a collection of loans where passed accounts are creditors" do 
			expect(@steve.credits_with(@account_ids)).to eq([@loan3, @loan4, @loan5, @loan6])
		end
	end

	describe '#debits_with' do 
		it "returns a collection of loans where passed accounts are debitors" do 
			expect(@steve.debits_with(@account_ids)).to eq([@loan1, @loan2, @loan7, @loan8])
		end
	end

end