class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def show
    result = Merchant.find(params[:id]).revenue
    respond_with({revenue: result})
  end

end
