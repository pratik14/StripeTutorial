Rails.application.routes.draw do

  get '/pricing', to: 'home#pricing'
  post '/subscribe', to: 'payment#subscribe'

  resource :sessions, only: [:new, :create] do
    member do
      get :destroy, as: 'destroy'
    end
  end
  root :to => 'home#index'
end
