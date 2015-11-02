class CategoriesController < ApplicationController

  def index
    balance = current_account.balance
    render json: {categories: balance.categories}
  end

  def create
    balance = current_account.balance
    category = Category.new name: params[:category][:name], balance_id: balance.id
    if category.save
      render json: {ok: true}
    else
      render json: {errors: category.errors}, status: :unprocessable_entity
    end
  end

end