Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get "/customers/find", to: "customers_finder#show"
      get "/invoice_items/find", to: "invoice_items_finder#show"
      get "/invoices/find", to: "invoices_finder#show"

      get "/customers/find_all", to: "customers_finder#index"
      get "/invoice_items/find_all", to: "invoice_items_finder#index"
      get "/invoices/find_all", to: "invoices_finder#index"

      get "/customers/random", to: "customers_random#show"
      get "/invoice_items/random", to: "invoice_items_random#show"
      get "/invoices/random", to: "invoices_random#show"

      resources :customers,     only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :invoices,      only: [:index, :show]
      resources :items,         only: [:index, :show]
      resources :merchants,     only: [:index, :show]
      resources :transactions,  only: [:index, :show]
    end
  end

end
