Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: :omniauth_callbacks }
  root controller: :main, action: :index
	get '*path', to: 'main#index', via: :all
	resources :transactions, only: [:new, :create]
end
