Rails.application.routes.draw do
  root to: 'welcome#home'
  # Customize devise
  devise_for :users, :controllers => { registrations: 'registrations' }
end
