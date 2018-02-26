Rails.application.routes.draw do

  get 'tasks/create'

  get 'tasks/destroy'

  get 'tasks/update'

  root to: 'welcome#home'

  resources :lists, except: [:new]

  # Customize devise
  devise_for :users, :controllers => { registrations: 'registrations' }
end
