class HistoricalLoan < ActiveRecord::Base
	belongs_to :old_loan, 
						 :class_name => "Loan"

	belongs_to :new_loan,
						 :class_name => "Loan"

# This is a way to link loans to each other.
# so when you square up loan, you have a way of linking back to original debts. 
# or, if you trade loans, you have a paper trail of who the loan belonged to originally. 
end
