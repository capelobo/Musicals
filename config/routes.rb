Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :instruments do
    get 'mine', on: :collection # get 'instruments/mine', to: 'instruments#mine'
  
    resources :orders, only: [:new, :create]
  end
 
  root to: 'instruments#index'
end
