Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :routes, only: :show
      resources :trips, only: [] do
        resources :deliveries, only: :create
      end
    end
  end
end
