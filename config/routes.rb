Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboard#show"
  end

  root to: "home#show"

  # clearance routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create, :show] do
    resource :password, controller: "clearance/passwords", only: [:create, :edit, :update]
    resources :followers, only: [:index]
    member do
      post "follow", to: "followed_users#create"
      delete "unfollow", to: "followed_users#destroy"
    end
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  post "text_shouts", to: "shouts#create", defaults: { content_type: TextShout }
  post "photo_shouts", to: "shouts#create", defaults: { content_type: PhotoShout }

  resources :shouts, only: [:show] do
    member do
      post "like", to: "likes#create"
      delete "unlike", to: "likes#destroy"
    end
  end
end
