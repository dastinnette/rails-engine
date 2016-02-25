class Api::V1::Transactions::InvoicesController < ApplicationController
  respond_to :json

  def show
    transaction = Transaction.find(params[:id])
    respond_with transaction.invoice
  end

end
