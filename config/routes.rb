# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  authenticate :admin_user do
    mount Sidekiq::Web => 'admin/sidekiq'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'public/articles#index'

  get 'about', to: 'public/about_me#index'
  get 'contact', to: 'public/contacts#index'
  post 'subscriptions', to: 'public/subscribe_article#create'

  scope module: 'public' do
    get 'projects', to: 'projects#index'
    resources :experiences, only: %i[show index]
    resources :articles, only: %i[show index] do
      resources :comments, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :experiences, only: %i[show index], defaults: { format: 'json' }
    end
  end

  get 'chat-room', to: 'chat_room/rooms#show'

  mount ActionCable.server => '/cable'
end
