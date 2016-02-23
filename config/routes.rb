Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :merchants, defaults: {format: :json} do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
      end
      resources :items, defaults: {format: :json} do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
      end
      resources :customers, defaults: {format: :json} do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
      end
      resources :invoice_items, defaults: {format: :json} do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
      end
      resources :invoices, defaults: {format: :json} do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
      end
      resources :transactions, defaults: {format: :json} do
        collection do
          get "find"
          get "find_all"
          get "random"
        end
      end

    end
  end

end
