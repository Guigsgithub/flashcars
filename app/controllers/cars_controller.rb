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
    @rental = Rental.new
    @rentals = Rental.where(car_id: @car.id)
    @rentals_dates = @rentals.map do |rental|
      {
        from: rental.start_date,
        to: rental.end_date
      }
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      flash[:notice] = "Your car have been created"
      redirect_to @car
    else
      flash[:alert] = "Add a new car failed"
      render :new
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    flash[:alert] = "Your car have been deleted"
    redirect_to user_path(@car.user)
  end

  private

  def car_params
    params.require(:car).permit(:user, :model, :price, :location, :capacity, :photo)
  end
end
