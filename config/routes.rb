Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"

  resources :articles do
    resources :comments
  end

  get 'admin/login', to: 'admin_authentication#new'
  post 'admin/login', to: 'admin_authentication#create'
  delete 'admin/logout', to: 'admin_authentication#destroy'

  post 'otp', to: 'token#create'

  get 'admin', to: 'admin_panel#index'
end
