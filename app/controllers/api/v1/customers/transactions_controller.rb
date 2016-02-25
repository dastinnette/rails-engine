class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.find_by(id: params[:customer_id]).transactions
  end

end
