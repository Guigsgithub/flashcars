class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def new
    @car = Car.find(params[:car_id])
    @rental = Rental.new
  end

  def create
    @car = Car.find(params[:car_id])
    @rental = Rental.new(params[:id])
    @rental.car_id = @car
    @rental.user_id = current_user
    if @car.save
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:user_id, :car_id, :start_date, :end_date)
  end
end
