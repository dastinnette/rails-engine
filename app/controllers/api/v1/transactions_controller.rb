class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end

  private

  def transaction_params
    params.permit(:id,
                  :invoice_id,
                  :credit_card_number,
                  :credit_card_expiration_date,
                  :result,
                  :created_at,
                  :updated_at)
  end

end
