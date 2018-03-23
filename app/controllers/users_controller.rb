class UsersController < ApplicationController


  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])

    @subscription = Stripe::Customer.retrieve(@user.stripe_costumer_token)
  end

end
