class Api::V1::Items::MerchantsController < ApplicationController
  respond_to :json

  def show
    item = Item.find(params[:id])
    respond_with item.merchant
  end

end
