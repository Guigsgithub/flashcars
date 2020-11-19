class CarsController < ApplicationController
  def index
    if params[:capacity].present?
      @cars = Car.where(capacity: params[:capacity])
    else
      @cars = Car.all
    end

    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end

    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { car: car }),
        image_url: helpers.asset_path('FLASHCAR_COULEUR.png')
      }
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
