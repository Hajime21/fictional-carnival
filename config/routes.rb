Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # strona główna
  root 'public#home'
  get 'trainings', to: 'trainings#index'
  get 'trainingsnew', to: 'trainings#new'
  get 'users', to: 'users#index'
  # ścieżki dla użytkowników
  resources :users, only: [:new, :create]

  # ścieżki dla treningów
  resources :trainings, only: [:new, :create]

  # rankingi
  get '/top_users_week', to: 'rankings#top_users_week'
  get '/top_users_month', to: 'rankings#top_users_month'

  # panel administratora
  namespace :admin do
    devise_for :users, controllers: {
      registrations: 'admin/registrations'
    }
    get '/', to: 'admin#index', as: 'dashboard'
    resources :users, path: '/', controller: 'admin'
      resources :trainings, path: '/', controller: 'admin'
  end
end