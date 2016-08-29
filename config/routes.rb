Rails.application.routes.draw do
  root 'platforms#index'

  resources :platforms do
    resources :games
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
