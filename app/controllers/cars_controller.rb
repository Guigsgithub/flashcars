class CarsController < ApplicationController
  def index
    if params[:capacity].present?
      @cars = Car.where(capacity: params[:capacity])
    else
      @cars = Car.all
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path(car)
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:user, :model, :price, :availability)
  end
end
