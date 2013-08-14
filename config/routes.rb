#config/routes.rb
SecurityApp::Application.routes.draw do

  
  resources :password_reset
  match 'forgot_password' => "password_resets#new"

  resources :baselines
  resources :families
  resources :subcontrols
  resources :sources

  resources :controls do
    collection do
      get :search
    end
   end
   

   

resources :user_sessions
  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  
  
  resources :users  # give us our some normal resource routes for users
  resources :user, :as => 'account'  # a convenience route

  match 'signup' => 'users#new', :as => :signup
  match 'home' => 'users#show', :as => :home

  root :to => "user_sessions#new"

end