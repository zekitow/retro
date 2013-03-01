RetroRails::Application.routes.draw do

  root :to => "home#index"

  resources :retrospectives
  resources :users do
    resources :retrospectives
  end

  resources :retrospectives do
    resources :goods
    resources :bads
  end

  match "/signup" => "users#new"
  match "/signin" => "users#authenticate"
  match "/logout" => "users#logout"
  match "/password" => "users#password"
  match "/password_update" => "users#password_update"
end
