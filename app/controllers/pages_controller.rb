class PagesController < ApplicationController
  def home
    @car_preferences = Car.new
    @rental_preferences = Rental.new
    @rentals = Rental.all
  end
end
