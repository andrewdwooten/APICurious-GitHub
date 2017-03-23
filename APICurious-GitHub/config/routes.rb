Rails.application.routes.draw do
  root to: "homes#show"
  resources :repositories, only: [:index, :new, :create]
  resources :pull_requests, only: [:index]
  get '/auth/github/callback', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  get  '/dashboard', to: 'dashboard#show'
  get '/commits', to: 'commits#show'
  get '/organizations', to: 'organizations#show'
  get '/followingactivity', to: 'follow_activity#show'
end
