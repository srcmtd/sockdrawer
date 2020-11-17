Rails.application.routes.draw do
  root to: 'socks#index'

  resources :socks do
    put 'clean', on: :member
    put 'dirty', on: :member
  end
end
