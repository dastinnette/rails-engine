class Api::V1::InvoiceItemsFinderController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.where(invoice_item_params)
  end

  def show
    respond_with InvoiceItem.find_by(invoice_item_params)
  end

  private

  def invoice_item_params
    params.permit(:id,
                  :item_id,
                  :invoice_id,
                  :quantity,
                  :unit_price,
                  :created_at,
                  :updated_at)
  end

end

#   def find_all_params
#     respond_with InvoiceItem.where(id: params[:id]) if params[:id]
#     respond_with InvoiceItem.where(item_id: params[:item_id]) if params[:item_id]
#     respond_with InvoiceItem.where(invoice_id: params[:invoice_id]) if params[:invoice_id]
#     respond_with InvoiceItem.where(quantity: params[:quantity]) if params[:quantity]
#     respond_with InvoiceItem.where(unit_price: params[:unit_price]) if params[:unit_price]
#     respond_with InvoiceItem.where(created_at: params[:created_at]) if params[:created_at]
#     respond_with InvoiceItem.where(updated_at: params[:updated_at]) if params[:updated_at]
#   end
#
#   def find_params
#     respond_with InvoiceItem.find_by(id: params[:id]) if params[:id]
#     respond_with InvoiceItem.find_by(item_id: params[:item_id]) if params[:item_id]
#     respond_with InvoiceItem.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
#     respond_with InvoiceItem.find_by(quantity: params[:quantity]) if params[:quantity]
#     respond_with InvoiceItem.find_by(unit_price: params[:unit_price]) if params[:unit_price]
#     respond_with InvoiceItem.find_by(created_at: params[:created_at]) if params[:created_at]
#     respond_with InvoiceItem.find_by(updated_at: params[:updated_at]) if params[:updated_at]
#   end
#
# end
