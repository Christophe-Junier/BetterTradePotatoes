# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :vegetables, param: :name do
        resources :prices, param: :value_date do
          get 'best_gain', controller: :best_gain, action: :index
          get 'worst_loss', controller: :worst_loss, action: :index
        end
      end
    end
  end
end
