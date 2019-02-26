Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions', passwords: 'passwords', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  get '/catalog', to: 'catalog#index', as: 'catalog'
  get '/catalog/book/:id', to: 'catalog#show', as: 'catalog_show'
  get '/' => 'home#index', as: 'home'
end
