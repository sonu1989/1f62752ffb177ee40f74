Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  root 'welcome#index'
  devise_for :users
  resources :favorites, only: [:index]
  post '/favorite/:tv_show_id' => 'favorites#favorite', as: :favorite
  post '/unfavorite/:tv_show_id' => 'favorites#unfavorite', as: :unfavorite
end
