# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :company, only: %I[index create destroy show update]
    resources :rents, only: %I[index create destroy show update]
    resources :users, only: %I[index create destroy show update]
    resources :items, only: %I[index create destroy show update]
  end
end
