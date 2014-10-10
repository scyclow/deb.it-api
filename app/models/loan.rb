class Loan < ActiveRecord::Base
	belongs_to :debtor, 
						 :class_name => "Account"
						 
	belongs_to :creditor, 
						 :class_name => "Account"

	has_many 	 :old_loans, 
					 	 :class_name => "HistoricalLoan", 
					 	 :foreign_key => :old_loan_id	
	 
	has_many 	 :new_loans, 
					 	 :class_name => "HistoricalLoan", 
					 	 :foreign_key => :new_loan_id

end
