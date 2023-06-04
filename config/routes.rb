# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :companies do
      resources :rents, only: %I[index create destroy show update]
      resources :companies, only: %I[index create destroy show update]
    end

    resources :users do
      resources :companies, only: %I[index create destroy show update]
      get 'rents', to: 'rents#index_for_company'
      resources :items, only: %I[index create destroy show update]
      resources :rents, only: %I[index create destroy show update]
    end
  end
end
