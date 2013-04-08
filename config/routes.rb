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


  post   "/votes/:model/:id" => "votes#create", as: :vote_up
  delete "/votes/:model/:id" => "votes#destroy", as: :vote_down

  get "/retrospectives/:retrospective_id/bads/:id/keep" => "bads#keep", as: :retrospective_bad_keeps
  get "/retrospectives/:retrospective_id/bads/:id/good" => "bads#to_good", as: :retrospective_bad_to_good

  match "/signup"          => "users#new"
  match "/signin"          => "users#authenticate"
  match "/logout"          => "users#logout"
  match "/password"        => "users#password"
  match "/password_update" => "users#password_update"
end
