Rails.application.routes.draw do

  root 'problems#index'

  resources 'problems'

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#process_login'
  get '/logout' => 'sessions#logout'

  get '/register' => 'users#new'
  post '/register' => 'users#create'

  get '/problem' => 'problems#new'
  post '/problem' => 'problems#create'

end
