Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'cookies/set_cookie'
  # get 'cookies/set_cookie', defaults: { format: :js }

  resources :articles # resourcers provides RESTful routes to rails resources
  get 'signup', to: 'users#new' # new route for users
  resources :users, except: [:new] #new is already defined
end
