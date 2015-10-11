class BalancesController < ApplicationController

	def index
    account = current_account
		render json: { balance: account.balance }
	end

end
