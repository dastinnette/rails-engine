class Api::V1::Items::BestDayController < ApplicationController
  respond_to :json

  def show
    date = Item.find(params[:id]).best_day
    respond_with ({best_day: date}) 
  end

end
