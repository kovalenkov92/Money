class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_account!
  before_action :create_balance

  private

  def create_balance
    if current_account
      current_account.balance = Balance.create unless current_account.balance
    end
  end
  
end