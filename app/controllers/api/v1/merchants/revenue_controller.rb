class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      result = Merchant.find(params[:id]).revenue_by_date(params[:date])
    else
      result = Merchant.find(params[:id]).revenue
    end
    respond_with({revenue: result})
  end

end
