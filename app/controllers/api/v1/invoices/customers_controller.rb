class Api::V1::Invoices::CustomersController < ApplicationController
  respond_to :json

  def show
    invoice = Invoice.find(params[:id])
    respond_with invoice.customer
  end

end
