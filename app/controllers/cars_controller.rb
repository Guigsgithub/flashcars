class CarsController < ApplicationController
  def index
    @cars = Car.where(capacity: params[:capacity], location: params[:location])
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

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:user, :model, :price, :location, :capacity, :photo)
  end
end
