Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # strona główna
  root 'public#home'
  get 'trainings', to: 'trainings#index'
  get 'trainingsnew', to: 'trainings#new'
  get 'trainingsedit', to: 'trainings#edit'
  get 'users', to: 'users#index'
  delete '/users/:id', to: 'users#destroy', as: 'destroy_user'
  # ścieżki dla użytkowników
  resources :users, only: [:new, :create, :delete]
  get '/training_history', to: 'users#training_history', as: 'training_history'
  # ścieżki dla treningów
  resources :trainings, only: [:new, :create, :delete]

  # rankingi
  get 'ranking', to: 'users#ranking', as: 'ranking'
  get 'ranking/weekly', to: 'users#weekly_ranking', as: 'weekly_ranking'
  get 'ranking/monthly', to: 'users#monthly_ranking', as: 'monthly_ranking'
  
  # panel administratora
  namespace :admin do
    #devise_for :users, controllers: {
    #  registrations: 'admin/registrations'
    #}
    get '/', to: 'admin#index', as: 'dashboard'
    resources :users, path: '/', controller: 'admin'
      resources :trainings, path: '/', controller: 'admin'
  end
end