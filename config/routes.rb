Rails.application.routes.draw do
  # Customize devise
  devise_for :users, :controllers => { registrations: 'registrations' }
end
