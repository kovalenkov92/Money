class TransactionsController < ApplicationController

  def index
  	transactions = Transaction.all.order(created_at: :desc)
  	render json: {transactions: transactions}
  end

  def create
  	transaction = Transaction.create 	summ: params[:transaction][:summ],
  																	 	comment: params[:transaction][:comment], 
  																	 	category_id: params[:transaction][:category_id]

  	balance = Balance.find 1
  	balance.value = balance.value + transaction.summ
    balance.save
    puts "#{balance.value}"
    render json: {ok: true}
  end

end
