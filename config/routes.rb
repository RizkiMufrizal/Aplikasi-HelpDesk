Rails.application.routes.draw do

  root 'problems#index'

  resources 'problems'

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#process_login'
  get '/logout' => 'sessions#logout'

  get '/register' => 'users#new'
  post '/register' => 'users#create'
  get '/verifikasi/:id' => 'users#verification'

  get '/problem' => 'problems#new'
  post '/problem' => 'problems#create'
  get '/problem/detail' => 'problems#show'
  get '/problem/detailEnable' => 'problems#showEnable'
  get '/problem/detailDisable' => 'problems#showDisable'
  get '/admin' => 'problems#admin'

end
