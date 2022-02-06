Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "public/articles#index"

  get "about", :to => "public/about_me#index"
  get "contact", :to => "public/contacts#index"
  post "subscriptions", :to => "public/subscribe_article#create"

  scope module: 'public' do
    resources :experiences, :only => [:show, :index]
    resources :articles, :only => [:show, :index] do
      resources :comments, :only => [:create]
    end
  end
end
