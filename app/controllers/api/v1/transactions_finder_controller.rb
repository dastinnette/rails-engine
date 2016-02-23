class Api::V1::TransactionsFinderController < ApplicationController
  respond_to :json

  def index
    find_all_params
  end

  def show
    find_params
  end

  private

  def find_all_params
    respond_with Transaction.where(params[:id]) if params[:id]
    respond_with Transaction.where(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with Transaction.where(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    respond_with Transaction.where(created_at: params[:created_at]) if params[:created_at]
    respond_with Transaction.where(updated_at: params[:updated_at]) if params[:updated_at]
    respond_with Transaction.where('LOWER(result) = ?', params[:result]) if params[:result]
  end

  def find_params
    respond_with Transaction.find(params[:id]) if params[:id]
    respond_with Transaction.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with Transaction.find_by(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    respond_with Transaction.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Transaction.find_by(updated_at: params[:updated_at]) if params[:updated_at]
    respond_with Transaction.find_by('LOWER(result) = ?', params[:result].downcase) if params[:result]
  end

end
