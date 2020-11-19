class CarsController < ApplicationController
  def index
    @rentals = Rental.all
    start_date = params[:query_start_date]
    end_date = params[:query_end_date]
    @rentals = @rentals.select do |rental|
      start_date > rental.end_date.strftime('%Y-%m-%d') || end_date < rental.start_date.strftime('%Y-%m-%d')
    end
    @cars = @rentals.map { |rental| Car.find(rental.car_id) }
    @cars = @cars.uniq
    @cars = @cars.select do |car|
      car.capacity >= params[:query_capacity].to_i && car.location == params[:query_location]
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
    params.require(:car).permit(:user, :model, :price, :location, :capacity, :photo, :description)
  end
end

