class TransactionsController < ApplicationController

  def index
  	transactions = Transaction.all.order(created_at: :desc)
  	render json: {transactions: transactions}
  end

end
