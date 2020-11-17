class CarPreferencesController < ApplicationController
  def home
    @car_preference = CarPreference.new
  end
end
