Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get "/customers/find", to: "customers_finder#show"
      get "/invoice_items/find", to: "invoice_items_finder#show"
      get "/invoices/find", to: "invoices_finder#show"
      get "/items/find", to: "items_finder#show"
      get "/merchants/find", to: "merchants_finder#show"
      get "/transactions/find", to: "transactions_finder#show"

      get "/customers/find_all", to: "customers_finder#index"
      get "/invoice_items/find_all", to: "invoice_items_finder#index"
      get "/invoices/find_all", to: "invoices_finder#index"
      get "/items/find_all", to: "items_finder#index"
      get "/merchants/find_all", to: "merchants_finder#index"
      get "/transactions/find_all", to: "transactions_finder#index"

      get "/customers/random", to: "customers_random#show"
      get "/invoice_items/random", to: "invoice_items_random#show"
      get "/invoices/random", to: "invoices_random#show"
      get "/items/random", to: "items_random#show"
      get "/merchants/random", to: "merchants_random#show"
      get "/transactions/random", to: "transactions_random#show"

      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], :controller => 'merchants/items'
        resources :invoices, only: [:index], :controller => 'merchants/invoices'
      end

      resources :transactions, only: [:index, :show] do
        member do
          get "/invoice", to: "transactions/invoices#show"
        end
      end

      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index], :controller => 'customers/invoices'
        resources :transactions, only: [:index], :controller => 'customers/transactions'
      end

      resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index], :controller => 'items/invoice_items'
        member do
          get "/merchant", to: "items/merchants#show"
        end
      end

      resources :invoices, only: [:index, :show] do
        resources :transactions, only: [:index], :controller => 'invoices/transactions'
        resources :invoice_items, only: [:index], :controller => 'invoices/invoice_items'
        resources :items, only: [:index], :controller => 'invoices/items'
        member do
          get "/merchant", to: "invoices/merchants#show"
          get "/customer", to: "invoices/customers#show"
        end
      end

      resources :invoice_items, only: [:index, :show] do
        member do
          get "/invoice", to: "invoice_items/invoices#show"
          get "/item", to: "invoice_items/items#show"
        end
      end

    end
  end

end
