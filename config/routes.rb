Rails.application.routes.draw do
  get 'visits/new'
  get 'visits/create'
  get 'visits/edit'
  get 'visits/update'
  get 'visits/destroy'
  get 'visits/index'
  get 'visits/show'
  get 'aids/new'
  get 'aids/create'
  get 'aids/edit'
  get 'aids/update'
  get 'aids/destroy'
  get 'aids/index'
  get 'aids/show'
  get 'nurses/new'
  get 'nurses/create'
  get 'nurses/edit'
  get 'nurses/update'
  get 'nurses/destroy'
  get 'nurses/index'
  get 'nurses/show'
  get 'patients/new'
  get 'patients/create'
  get 'patients/edit'
  get 'patients/update'
  get 'patients/destroy'
  get 'patients/index'
  get 'patients/show'
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/rides/new", to: "rides#new"
  resources :nurses
  resources :patients
  resources :visits
  resources :attractions
  resources :users
end
