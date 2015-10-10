class TransactionsController < ApplicationController

  def index
    transactions = Transaction.all.order(created_at: :desc).limit(10)
    render json: {transactions: transactions}
  end

  def show
    transaction = Transaction.find params[:id]
    render json: {transaction: transaction}
  end

  def create
    transaction = Transaction.create  summ: params[:transaction][:summ],
                                      comment: params[:transaction][:comment], 
                                      category_id: params[:transaction][:category_id]
    category = transaction.category
    balance = Balance.find 1
    if transaction.errors.empty?
      balance.value = balance.value + transaction.summ
      balance.save
      category.value = category.value + transaction.summ
      category.save
      render json: {ok: true}
    else
      render json: {errors: transaction.errors}, status: :unprocessable_entity
    end

  end

  def destroy
    transaction = Transaction.find params[:id]
    category = transaction.category
    balance = Balance.find 1
    if transaction
      balance.value = balance.value - transaction.summ
      balance.save
      category.value = category.value - transaction.summ
      category.save
      transaction.destroy
      render json: {ok: true}
    else
      render json: {errors: transaction.errors}, status: :unprocessable_entity
    end
  end

end
