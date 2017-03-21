Rails.application.routes.draw do
  root to: "homes#show"
  get '/auth/github/callback', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  get  '/dashboard', to: 'dashboard#show'
end
