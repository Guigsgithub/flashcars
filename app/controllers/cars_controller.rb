class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to @car
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:user, :model, :price, :availability, :location, :capacity)
  end
end
