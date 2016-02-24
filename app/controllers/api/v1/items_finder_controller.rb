class Api::V1::ItemsFinderController < ApplicationController
  respond_to :json

  def index
    find_all_params
  end

  def show
    find_params
  end

  private

  def find_all_params
    respond_with Item.where(id: params[:id]) if params[:id]
    respond_with Item.where('LOWER(name) = ?', params[:name].downcase) if params[:name]
    respond_with Item.where('LOWER(description) = ?', params[:description].downcase) if params[:description]
    respond_with Item.where(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with Item.where(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Item.where(created_at: params[:created_at]) if params[:created_at]
    respond_with Item.where(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def find_params
    respond_with Item.find(params[:id]) if params[:id]
    respond_with Item.find_by('LOWER(name) = ?', params[:name].downcase) if params[:name]
    respond_with Item.find_by('LOWER(description) = ?', params[:description].downcase) if params[:description]
    respond_with Item.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with Item.find_by(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Item.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Item.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end

end
