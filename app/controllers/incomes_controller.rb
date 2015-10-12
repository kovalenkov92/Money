class IncomesController < ApplicationController

  def index
    balance = current_account.balance
    incomes = balance.incomes.order(income_time: :desc).limit(5)
    render json: { incomes: incomes }    
  end

  def create
    balance = current_account.balance
    income = Income.create  balance_id: balance.id, 
                            value: params[:income][:diff],
                            income_time: params[:income][:time].to_date,
                            comment: params[:income][:comment]

    if income.errors.empty?
      balance.value = balance.value + income.value
      balance.save
      render json: {ok: true}
    else
      render json: {errors: income.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    income = Income.find params[:id]
    balance = current_account.balance
    if income
      balance.value = balance.value - income.value
      balance.save
      income.destroy
      render json: {ok: true}
    else
      render json: {errors: income.errors}, status: :unprocessable_entity
    end
  end

end
