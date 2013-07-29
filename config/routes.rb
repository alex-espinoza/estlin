Estlin::Application.routes.draw do
  resources :users
  resources :tweets

  root :to => "tweets#index"
  match "/auth/twitter", as: "signin"
  match "/auth/twitter/callback", to: "sessions#create"
  match "/signout", to: "sessions#destroy", as: "signout"
  match "/auth/failure", to: "sessions#failed", as: "failed_authentication"
end
