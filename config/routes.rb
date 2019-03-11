Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions", passwords: "passwords", omniauth_callbacks: "users/omniauth_callbacks" }
  # devise_for :users, :controllers => { , :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "home#index"
  # get 'users/auth/facebook/callback' => 'callback#index'
  get '/catalog' => 'catalog#index', as: 'catalog'
  get '/catalog/book/:id', to: 'catalog#show', as: 'catalog_show'
  get '/' => 'home#index', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
