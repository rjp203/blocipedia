Rails.application.routes.draw do
  
  get 'about' => 'welcome#about'

  root 'welcome#index'
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :wikis

end