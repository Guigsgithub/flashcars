class CarsController < ApplicationController
  def index
    @cars = Car.all
    @rentals = Rental.all
    @availabilities = []
    if params[:query_capacity] != "" && params[:query_capacity] || params[:query_location] != "" && params[:query_location] || params[:query_start_date] != "" && params[:query_start_date] || params[:query_end_date] != "" && params[:query_end_date]
      @cars = @cars.select do |car|
        car.capacity.to_i >= params[:query_capacity].to_i && car.location.downcase == params[:query_location].downcase
      end
      @rentals = @rentals.select do |rental|
        rental.car.capacity.to_i >= params[:query_capacity].to_i && rental.car.location.downcase == params[:query_location].downcase
      end
      start_date = params[:query_start_date]
      end_date = params[:query_end_date]
      if @rentals.nil? == false
        @rentals = @rentals.each do |rental|
          r_start_date = rental.start_date.strftime('%Y-%m-%d')
          r_end_date = rental.end_date.strftime('%Y-%m-%d')
          if start_date > r_start_date
            if end_date > r_end_date
              @availabilities.push([rental.car_id, 0])
            else
              @availabilities.push([rental.car_id, 1])
            end
          else
            if end_date < r_end_date
              @availabilities.push([rental.car_id, -1])
            else
              @availabilities.push([rental.car_id, 0])
            end
          end
        end
        @cars = @availabilities.uniq
        @cars = @cars.map { |car| [Car.find(car[0]), car[1]] }
        @cars = @cars.select {|car| car[1] != 1}
      else
        @cars = Car.all
        @cars = @cars.map { |car| [car, ""] }
      end
      if @cars == []
        @cars = Car.all
        @cars = @cars.map { |car| [car, ""] }
      end
    else
      @cars = Car.all
      @cars = @cars.map { |car| [car, ""] }
    end

    @markers = @cars.map do |car|
      {
        lat: car[0].latitude,
        lng: car[0].longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { car: car }),
        image_url: helpers.asset_path('FLASHCAR_COULEUR.png')
      }
    end
    p @markers
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
    params.require(:car).permit(:user, :model, :price, :location, :capacity, :photo, :description)
  end
end
