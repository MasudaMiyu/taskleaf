Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  #adminモデルのルーティング(url path・ヘルパーメソッドController#Action)をusersで指定
  namespace :admin do
    resources :users
  end
  root to: 'tasks#index'
  resources :tasks
  
end
