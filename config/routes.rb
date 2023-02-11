Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  get '/users/:user_id/posts', to: 'posts#index', as: 'post_path'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'post_show'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create', as: 'comment_create'
  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'comment_new'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'like_create'
  get '/users/:user_id/posts/:id/likes/new', to: 'likes#new', as: 'like_new'
  
  resources :users, only: [:index, :show]

  resources :posts, only: [:new, :create]
end
