Rails.application.routes.draw do
  root to: "homes#show"
  get '/auth/github/callback', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  get  '/dashboard', to: 'dashboard#show'
  get '/commits', to: 'commits#show'
  get '/repositories', to: 'repositories#show'
  get '/organizations', to: 'organizations#show'
  get '/followingactivity', to: 'follow_activity#show'
end
