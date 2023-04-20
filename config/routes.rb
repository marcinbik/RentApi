Rails.application.routes.draw do
  namespace :api do
    resources :companies do
      resources :rents, only: [:create, :destroy, :show, :update]
    end
    resources :users do
      resources :companies, only: [:index, :create, :destroy, :show, :update]
    end
  end
end
