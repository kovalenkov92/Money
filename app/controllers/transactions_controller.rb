class TransactionsController < ApplicationController

  def index
    balance = current_account.balance
    categories = balance.categories.order(:name)

    transactions = []

    categories.each do |category|
      transactions << { category: category.name, 
                        transactions: category.transactions.order(transaction_time: :desc).limit(10) }
    end

    render json: {transactions: transactions}
  end

  def create
    balance = current_account.balance
    transaction = Transaction.new  summ: params[:transaction][:summ],
                                   comment: params[:transaction][:comment],
                                   transaction_time: params[:transaction][:time].to_date,
                                   category_id: params[:transaction][:category_id]

    if transaction.save
      category = transaction.category
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
      response << { name:"#{c.name}",color: "rgba(#{rand(255)},#{rand(255)},#{rand(255)},0.6)", y: summ } unless (summ == 0)
    end

    render json: {response: response}
  end

  def generate_area_data
    balance = current_account.balance
    categories = balance.categories
    from = params[:from].to_date.beginning_of_day.to_datetime
    to = params[:to].to_date.end_of_day.to_datetime

    expenses = []
    while from < to do
      range = (from.to_date.beginning_of_day..from.to_date.end_of_day)
      summ_per_day = []
      categories.each do |c|
        transactions = c.transactions.select{|t| range.cover?(t.transaction_time)}
        summ = transactions.map(&:summ).inject(0){ |result, elem| result + elem }
        summ_per_day << summ
      end
      summ_per_day = summ_per_day.inject(0){ |result, elem| result + elem }
      date = (from.to_i.to_s + "000").to_i
      expenses << [date,summ_per_day]
      from += 1.day
    end
    render json: {response: expenses}
  end

  def search
    balance = current_account.balance
    categories = balance.categories.order(:name)

    transactions = []

    categories.each do |c|
      if is_numeric?(params[:query])
        t = c.transactions.where(summ: params[:query])
      else
        t = c.transactions.where("comment ILIKE ?", '%' + params[:query] + '%')
      end
      transactions << {category: c.name, transactions: t.limit(10)} unless t === []
    end

    render json: {transactions: transactions}
  end

  def search_by_date
    balance = current_account.balance
    categories = balance.categories.order(:name)

    transactions = []

    categories.each do |c|
      t = c.transactions.where(transaction_time: params[:date].to_date)
      transactions << {category: c.name, transactions: t.limit(10)} unless t === []
    end
    render json: {transactions: transactions}
  end

  private

  def is_numeric?(obj)
    obj.to_s == obj.to_i.to_s
  end

end