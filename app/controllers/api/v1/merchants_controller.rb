class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
