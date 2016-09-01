Rails.application.routes.draw do
  devise_for :users

  root 'platforms#index'

  resources :teams

  resources :platforms do
    resources :games
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
