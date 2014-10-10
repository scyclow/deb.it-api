module Api::V1

	class AccountsController < ApplicationController
		respond_to :json
		def show
			@account = Account.find(params[:id])
			
			# render :json => @account, :callback => params[:callback]
		end
	end

end