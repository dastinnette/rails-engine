class Api::V1::InvoiceItems::ItemsController < ApplicationController
  respond_to :json

  def show
    invoice_item = InvoiceItem.find(params[:id])
    respond_with invoice_item.item
  end

end
