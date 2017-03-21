Rails.application.routes.draw do
  root to: "homes#show"
  get '/auth/github/callback', to: "sessions#create"
end
