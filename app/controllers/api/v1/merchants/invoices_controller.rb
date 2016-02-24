class Api::V1::Merchants::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.where(merchant_id: params[:merchant_id])
  end

end
