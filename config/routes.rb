Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :event_attendings, only: [:new, :destroy]

  root "events#index"
end
