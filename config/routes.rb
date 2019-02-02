Rails.application.routes.draw do
  devise_for :users
  root controller: :main, action: :index
  resources :sessions, only: [:index, :new, :create, :show]
  get '*path', to: 'main#index', via: :all
  post 'sessions/new', to: 'sessions#new'
end
