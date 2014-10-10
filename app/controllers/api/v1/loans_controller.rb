module Api::V1

	class LoansController < ApplicationController
		def show
			@loan = Loan.find(params[:id])
		end

		def create
			debtor = Account.find_by(name: loan_params[:debtor_name])
			creditor = Account.find_by(name: loan_params[:creditor_name])

			@loan = Loan.new(amount: loan_params[:amount], 
											 description: loan_params[:description], 
											 debtor: debtor, 
											 creditor: creditor)

			render json: @loan if @loan.save
		end

		private
		def loan_params
			params.require(:loan).permit(:creditor_name, :debtor_name, :amount, :description, :closed, :private_debt)
		end
	end

end