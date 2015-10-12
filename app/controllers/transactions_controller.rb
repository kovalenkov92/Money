class TransactionsController < ApplicationController

  def index
    balance = current_account.balance
    categories = balance.categories

    transactions = []

    categories.each do |category|
      transactions << { category: category.name, transactions: category.transactions.order(transaction_time: :desc).limit(10) }
    end

    render json: {transactions: transactions}
  end

  def show
    transaction = Transaction.find params[:id]
    render json: {transaction: transaction}
  end

  def create
    transaction = Transaction.create  summ: params[:transaction][:summ],
                                      comment: params[:transaction][:comment],
                                      transaction_time: params[:transaction][:time].to_date,
                                      category_id: params[:transaction][:category_id]

    category = transaction.category
    balance = current_account.balance
    if transaction.errors.empty?
      balance.value = balance.value - transaction.summ
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
    balance = current_account.balance
    if transaction
      balance.value = balance.value + transaction.summ
      balance.save
      category.value = category.value - transaction.summ
      category.save
      transaction.destroy
      render json: {ok: true}
    else
      render json: {errors: transaction.errors}, status: :unprocessable_entity
    end
  end

  def generate_graph
    balance = current_account.balance
    categories = balance.categories
    range = (params[:from].to_date.beginning_of_day..params[:to].to_date.end_of_day)

    response = []

    categories.each do |c|
      transactions = c.transactions.select{|t| range.cover?(t.transaction_time)}
      summ = transactions.map(&:summ).inject(0){ |result, elem| result + elem }
      response << { name:"#{c.name}", y: summ.abs } unless (summ == 0)
    end

    render json: {response: response}
  end

end