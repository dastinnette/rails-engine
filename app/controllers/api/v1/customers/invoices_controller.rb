class Api::V1::Customers::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.where(customer_id: params[:customer_id])
  end

end
