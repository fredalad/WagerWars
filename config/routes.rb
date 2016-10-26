Rails.application.routes.draw do
  devise_for :users

  root 'platforms#index'

  resources :users do
    resources :messages
  end
  resources :tickets

  resources :tournaments
  # root 'users#index'
  resources :teams do
    resources :matches do
      resources :tickets
    end
    resources :users
  end

  resources :platforms do
    resources :games do
      resources :ladders do
        resources :settings, only: [:new, :create]
        resources :teams, only: [:new,:create]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
