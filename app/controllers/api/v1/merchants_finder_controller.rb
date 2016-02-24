class Api::V1::MerchantsFinderController < ApplicationController
  respond_to :json

  def index
    find_all_params
  end

  def show
    find_params
  end

  private

  def find_all_params
    respond_with Merchant.where(id: params[:id]) if params[:id]
    respond_with Merchant.where('LOWER(name) = ?', params[:name].downcase) if params[:name]
    respond_with Merchant.where(created_at: params[:created_at]) if params[:created_at]
    respond_with Merchant.where(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def find_params
    respond_with Merchant.find(params[:id]) if params[:id]
    respond_with Merchant.find_by('LOWER(name) = ?', params[:name].downcase) if params[:name]
    respond_with Merchant.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Merchant.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end

end
