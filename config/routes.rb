Rails.application.routes.draw do

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#process_login'

  get '/register' => 'users#new'
  post '/register' => 'users#create'

end
