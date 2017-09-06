Rails.application.routes.draw do
  
  get 'about' => 'welcome#about'

  root 'wikis#index'
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :wikis, :users, :charges
  
end