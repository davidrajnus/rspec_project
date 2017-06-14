Rails.application.routes.draw do

  get 'welcome/index'

  root 'users#new'
  get 'sessions/new'

  resources :users
  resources :statuses
  resources :likes
  resource :session

  get 'likes/new'

  get 'likes/create'

  get 'likes/edit'

  get 'likes/update'

  get 'likes/delete'

  get 'statuses/new'

  get 'statuses/create'

  get 'statuses/edit'

  get 'statuses/update'

  get 'statuses/delete'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

end
