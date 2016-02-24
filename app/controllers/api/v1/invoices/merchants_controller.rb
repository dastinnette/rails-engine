class Api::V1::Invoices::MerchantsController < ApplicationController
  respond_to :json

  def index
    invoice = Invoice.find(params[:id])
    respond_with invoice.merchant
  end

end
