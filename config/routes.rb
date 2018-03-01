Rails.application.routes.draw do

  get '/users', to: 'follows#index'
  # post '/follow/:id', to: 'follows#add_follow'
  post '/follows', to: "follows#create", as: "follow"
  delete '/follows', to: "follows#destroy", as: "unfollow"

  root to: 'welcome#home'

  resources :lists, except: [:new]

  # Customize devise
  devise_for :users, :controllers => { registrations: 'registrations' }
end
