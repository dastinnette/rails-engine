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
      resources :items, defaults: {format: :json}


    end
  end




end
