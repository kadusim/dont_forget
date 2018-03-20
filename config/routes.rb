Rails.application.routes.draw do

  # get '/users', to: 'follows#index'
  # post   '/follows', to: 'follows#create',  as: 'follow'
  # delete '/follows', to: 'follows#destroy', as: 'unfollow'

  root to: 'welcome#home'

  resources :lists,     except: [:new]
  resources :favorites, only:   [:create, :destroy, :index]
  resources :users,     only:   [:index]

  # Customize devise
  devise_for :users, :controllers => { registrations: 'registrations' }
end
