class Account < ActiveRecord::Base
	belongs_to :user

	has_many :debits, 
					 :class_name => "Loan", 
					 :foreign_key => :creditor_id

	has_many :credits, 
					 :class_name => "Loan", 
					 :foreign_key => :debtor_id

	def balance(account_ids=[])
		sum_debits(account_ids) - sum_credits(account_ids)
	end

	def sum_debits(account_ids=[])
		dr = account_ids.empty? ? debits : debits_with(account_ids)
		dr.where(private_debt:false).sum(:amount)
	end

	def debits_with(account_ids)
		debits.where(debtor_id: account_ids)
	end

	def sum_credits(account_ids=[])
		cr = account_ids.empty? ? credits : credits_with(account_ids)
		cr.where(private_debt:false).sum(:amount)
	end

	def credits_with(account_ids)
		credits.where(creditor_id: account_ids)
	end
end
