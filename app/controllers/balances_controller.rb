class BalancesController < ApplicationController

	def index
		balance = Balance.first
		render json: { balance: balance }
	end


end
