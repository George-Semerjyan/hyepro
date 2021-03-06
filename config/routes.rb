Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only => [:show]
  resources :posts, execpt: [:edit]
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
