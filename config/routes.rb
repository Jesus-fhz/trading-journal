Rails.application.routes.draw do
 
  root :to  => 'session#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' =>'session#destroy' 

  get '/change_password' => 'users#change_password'
  patch '/change_password' => 'users#update_password'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trades, :types, :users, :journals
end
