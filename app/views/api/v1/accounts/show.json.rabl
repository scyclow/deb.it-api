object @account
attributes :id, 
					 :name, 
					 :limit, 
					 :balance, 
					 :sum_debits, 
					 :sum_credits

loans = (@account.debits + @account.credits).sort_by{|loan| loan.created_at}

child loans => :loans do |loan|
	loan.each do

		attributes :id,
							 :creditor_id,
							 :debtor_id,
							 :amount,
							 :description,
							 :closed,
							 :private_debt,
							 :created_at

		node :type do |l|
			@account.id == l.creditor_id ? "debit" : "credit"
		end

		glue :debtor do 
		  attributes :name => :debtor_name
		end

		glue :creditor do 
		  attributes :name => :creditor_name
		end
	end
	
end


# child :debits => :debits do |debits|
# end

# child :credits => :credits do |credits|
# 	credits.each do 

# 		attributes :id,
# 							 :creditor_id,
# 							 :debtor_id,
# 							 :amount,
# 							 :description,
# 							 :closed,
# 							 :private_debt,
# 							 :created_at

# 		glue :debtor do 
# 		  attributes :name => :debtor_name
# 		end

# 		glue :creditor do 
# 		  attributes :name => :creditor_name
# 		end
# 	end
# end


