class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.where(customer_id: params[:customer_id])
  end

end
