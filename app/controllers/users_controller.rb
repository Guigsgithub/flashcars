class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @rentals = Rental.where(user_id: params[:id])
    @cars = Car.where(user_id: params[:id])
  end
end
