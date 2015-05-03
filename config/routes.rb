Rails.application.routes.draw do

  resources :media_items

  resources :users

  resources :password_resets, :only => [:new, :create, :edit, :update]

  get 'activate/:code' => 'activations#create', :as => :activate

  get 'signup' => 'users#new', :as => :signup

  get 'logout' => 'user_sessions#destroy', :as => :logout

  get 'login' => 'user_sessions#new', :as => :login

  resources :user_sessions, except: [:destroy]

  root 'users#index'

end
