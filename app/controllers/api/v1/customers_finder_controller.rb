class Api::V1::CustomersFinderController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.where(customer_params)
  end

  def show
    respond_with Customer.find_by(customer_params)
  end

  private

  def customer_params
    params.permit(:id,
                  :first_name,
                  :last_name,
                  :created_at,
                  :updated_at)
  end

end

#   def find_all_params
#     respond_with Customer.where(id: params[:id]) if params[:id]
#     respond_with Customer.where('LOWER(first_name) = ?', params[:first_name].downcase) if params[:first_name]
#     respond_with Customer.where('LOWER(last_name) = ?', params[:last_name].downcase) if params[:last_name]
#     respond_with Customer.where(created_at: params[:created_at]) if params[:created_at]
#     respond_with Customer.where(updated_at: params[:updated_at]) if params[:updated_at]
#   end
#
#   def find_params
#     respond_with Customer.find(params[:id]) if params[:id]
#     respond_with Customer.find_by('LOWER(first_name) = ?', params[:first_name].downcase) if params[:first_name]
#     respond_with Customer.find_by(created_at: params[:created_at]) if params[:created_at]
#     respond_with Customer.find_by(updated_at: params[:updated_at]) if params[:updated_at]
#   end
#
# end
