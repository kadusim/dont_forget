Rails.application.routes.draw do

  root to: 'welcome#home'

  resources :lists, except: [:new]

  # Customize devise
  devise_for :users, :controllers => { registrations: 'registrations' }
end
