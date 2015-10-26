Rails.application.routes.draw do

  resources :user_comments, only: [:create, :destroy]

  resources :goal_comments, only: [:create, :destroy]

  resources :users, only: [:new, :create, :show]

  resources :goals, only: [:show, :create, :edit, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]

end
