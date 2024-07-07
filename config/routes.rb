Rails.application.routes.draw do

  # letter openerの設定、http://localhost:3000/letter_opener/が見れるようになる
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'staticpages#top'
  resources :users, only: [:new, :create] do
    collection do
      get :my_articles
      get :my_favorites
    end
  end

  resource :profile, only: [:edit, :show, :update]

  resources :articles do
    resources :favorites, only: [:create, :destroy]
    resources :comments, shallow: true do
      resources :commentfavorites, only: [:create, :destroy]
    end
    end
  
  get 'login' => 'usersessions#new', :as => :login
  post 'login' => "usersessions#create"
  delete 'logout' => 'usersessions#destroy', :as => :logout
  resources :password_resets, only: [:create, :edit, :update]

  # Defines the root path route ("/")
  # root "posts#index"
end
