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
    @rental = Rental.new(rental_params)
    @rental.car = @car
    @rental.user = current_user
    if @rental.save
      flash[:notice] = "Your booking is done"
      redirect_to user_path(@rental.user)
    else
      flash[:alert] = "Your booking has failed"
      render :new
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    if @rental.destroy
      flash[:alert] = "Your booking have been deleted"
      redirect_to user_path(@rental.user)
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:user_id, :car_id, :start_date, :end_date)
  end
end
