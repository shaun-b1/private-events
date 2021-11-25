Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :event_attendings, only: [:new, :delete]

  root "events#index"
end
