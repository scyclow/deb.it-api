class User < ActiveRecord::Base
	has_one :api_key
	has_one :account
	after_create :create_api_key

	private
	def create_api_key
		ApiKey.create user: self
	end
end
