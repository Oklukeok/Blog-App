Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show] do
      resources :likes, only: %i[create show]
    end
  end

  resources :posts, only: %i[new create]
  resources :comments, only: %i[new create]
end
