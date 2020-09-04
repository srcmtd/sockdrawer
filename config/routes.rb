Rails.application.routes.draw do
  root to: 'socks#index'

  resources :socks
end
