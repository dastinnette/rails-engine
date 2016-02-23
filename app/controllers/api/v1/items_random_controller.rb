class Api::V1::ItemsRandomController < ApplicationController
  respond_to :json

  def show
    respond_with Item.random
  end

end
