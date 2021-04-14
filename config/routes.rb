Rails.application.routes.draw do
  root to: 'socks#index'

  get 'account', to: 'rodauth#account'

  resources :socks do
    # GET /socks/dirty
    get 'dirty', on: :collection

    member do
      # PUT /socks/:id/clean
      put 'clean', to: 'socks#mark_clean'
      # PUT /socks/:id/dirty
      put 'dirty', to: 'socks#mark_dirty'
    end
  end
end
