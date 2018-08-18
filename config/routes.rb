Rails.application.routes.draw do

  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  post "/patients/choose_nurse", to: "patients#choose_nurse"
  post "/visits/filter_by_nurse", to: "visits#filter_by_nurse"
    post "/patients/filter_nurses", to: "nurses#filter_nurses"

  resources :nurses, only: [:show] do
   resources :patients, only: [:show, :index]
   resources :visits, only: [:show, :index]
  end

  resources :paients, only: [:show] do
   resources :visits, only: [:show, :index]
  end

  resources :patients
  resources :nurses
  resources :visits
  resources :users
  resources :aids
end
