class Api::V1::InvoicesRandomController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.random
  end

end
