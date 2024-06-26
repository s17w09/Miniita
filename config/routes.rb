Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'staticpages#top'
  resources :users, only: [:new, :create]
  resources :articles do
    resources :favorites, only: [:create, :destroy]
  end
  
  get 'login' => 'usersessions#new', :as => :login
  post 'login' => "usersessions#create"
  delete 'logout' => 'usersessions#destroy', :as => :logout

  # Defines the root path route ("/")
  # root "posts#index"
end
