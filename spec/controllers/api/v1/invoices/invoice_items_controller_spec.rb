require "rails_helper"

RSpec.describe Api::V1::Invoices::InvoiceItemsController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice items associated with a merchants invoice" do
      invoice = create(:invoice)
      invoice_items = create_list(:invoice_item, 2)
      invoice.invoice_items << invoice_items

      get :index, id: "2", invoice_id: invoice.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["item_id"]).to eq(invoice_items.first.item_id)
      expect(json_response.first["invoice_id"]).to eq(invoice_items.first.invoice_id)
      expect(json_response.last["quantity"]).to eq(invoice_items.last.quantity)
      expect(json_response.last["unit_price"]).to eq(6)
    end
  end
end
