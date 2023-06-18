Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'cookies/set_cookie'
  # get 'cookies/set_cookie', defaults: { format: :js }

  resources :articles # resourcers provides RESTful routes to rails resources
  # REST - Representational state transfer - mapping http verbs(FE) (get, post, patch/put, destroy) to CRUD operations. 
  get 'signup', to: 'users#new' # new route for users
  resources :users, except: [:new] #new is already defined

  get '/adarsh', to: redirect('https://www.github.com/adar5h')

  # We won't be creating resourceful routes for sessions
  # Sessions logging in/out won't be hitting the Database
  get 'login', to: 'sessions#new'
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
end
