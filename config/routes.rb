Rails.application.routes.draw do
  resources :fx_histories
  resources :port_histories
  resources :portfolios
  resources :exchanges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
