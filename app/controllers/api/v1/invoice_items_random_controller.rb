class Api::V1::InvoiceItemsRandomController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.random
  end

end
