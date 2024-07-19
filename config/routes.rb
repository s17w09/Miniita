# frozen_string_literal: true

Rails.application.routes.draw do
  get 'oauths/oauth'
  get 'oauths/callback'
  # letter openerの設定、http://localhost:3000/letter_opener/が見れるようになる
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'staticpages#top'
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
  
  resources :users, only: %i[new create] do
    collection do
      get :my_articles
      get :my_favorites
    end
  end

  resource :profile, only: %i[edit show update]

  resources :articles do
    resources :favorites, only: %i[create destroy]
    resources :comments, shallow: true do
      resources :commentfavorites, only: %i[create destroy]
    end
  end

  get 'login' => 'usersessions#new', :as => :login
  post 'login' => 'usersessions#create'
  delete 'logout' => 'usersessions#destroy', :as => :logout
  resources :password_resets, only: %i[create edit update]

  # Defines the root path route ("/")
  # root "posts#index"
end
