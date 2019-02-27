Rails.application.routes.draw do
  resources :home, only: [:index], as: 'home'
  root to: 'home#index'
  resources :catalog, only: %i[index show], as: 'catalog'
end
