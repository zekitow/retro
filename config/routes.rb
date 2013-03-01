RetroRails::Application.routes.draw do



  root :to => "home#index"

  resources :projects
  resources :users do
    resources :projects
  end

  resources :projects do
    resources :items do
      resources :tasks
    end
  end

  match "/signup" => "users#new"
  match "/signin" => "users#authenticate"
  match "/logout" => "users#logout"
  match "/password" => "users#password"
  match "/password_update" => "users#password_update"
end
