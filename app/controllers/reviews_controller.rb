class ReviewsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @car = Car.find(params[:car_id])
    @review.car = @car
    if @review.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to car_path(@review.car)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
