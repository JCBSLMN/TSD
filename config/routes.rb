Rails.application.routes.draw do
  resources :rides
  devise_for :users
  root 'home#index'
  post '/rides/:id/buy', to: "rides#buy", as: "buy"
  get '/rides/:id/success', to: "rides#success", as: "success"
  get '/rides/:id/cancel', to: "rides#cancel", as: "cancel"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
