class CarsController < ApplicationController
  def index
    if params[:capacity].present?
      @cars = Car.where(capacity: params[:capacity])
    else
      @cars = Car.all
    end
  end
end
