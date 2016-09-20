Rails.application.routes.draw do
  devise_for :users

  root 'platforms#index'

  resources :users do
    resources :messages
  end

 # root 'users#index'
  resources :teams do
    resources :matches
    resources :users
  end

  resources :platforms do
    resources :games do
      resources :ladders do
        resources :teams, only: [:new,:create]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
