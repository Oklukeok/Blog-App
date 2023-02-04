Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i[index show] do
  resources :posts, only: %i[index show]
  end
end

