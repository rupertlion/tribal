Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: :omniauth_callbacks }
  root controller: :main, action: :index
	resources :transactions, only: [:new, :create]
	resources :sessions, only: [:show]
	match 'register', to: 'main#index', via: [:get]
	match 'login', to: 'main#index', via: [:get]
end
