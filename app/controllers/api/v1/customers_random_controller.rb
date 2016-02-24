class Api::V1::CustomersRandomController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.random
  end

end
