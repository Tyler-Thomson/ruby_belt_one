Rails.application.routes.draw do
  root 'application#index'
  resources :users, exclude: [:index]

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'ideas' => 'ideas#index'
  post 'ideas' => 'ideas#create'
  get 'ideas/:id' => 'ideas#show'
  delete 'ideas/:id' => 'ideas#destroy'

  post 'likes' => 'likes#create'
end
