ToddyCat::Application.routes.draw do
      
  resources :books

  resources :bookshelves

  resources :floors do
    resources :flats
  end

  # Sign in/out
  get    'login' => 'session#new', as: :login
  post   'login' => 'session#create'
  delete 'logout' => 'session#destroy', as: :logout
  
  # Registration
  get  'register' => 'registration#new', as: :register
  post 'register' => 'registration#create'
  
  # Password reset
  get   'reset/:code' => 'password#edit', as: :reset
  put   'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'
  
  get 'privacy' => 'site#privacy'
  get 'terms'   => 'site#terms'
  
  root 'site#index'
end
