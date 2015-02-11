Rails.application.routes.draw do

  get '/pricing', to: 'home#pricing'
  post '/subscribe', to: 'home#subscribe'

  resource :sessions, only: [:new] do
    member do
      get :destroy, as: 'destroy'
    end
  end
  root :to => 'home#index'
end
