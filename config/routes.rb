#config/routes.rb
SecurityApp::Application.routes.draw do

  resources :baselines

  resources :control_families

  resources :subcontrols

  resources :sources

  resources :controls

   root :to => "users#new"

resources :user_sessions
  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  
  
  resources :users  # give us our some normal resource routes for users
  resources :user, :as => 'account'  # a convenience route

  match 'signup' => 'users#new', :as => :signup

  
end