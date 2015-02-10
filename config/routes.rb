Rails.application.routes.draw do

  get '/pricing', to: 'home#pricing'
  post '/subscribe', to: 'home#subscribe'
  root :to => 'home#index'
end
