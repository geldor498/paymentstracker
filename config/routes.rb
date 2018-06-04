Rails.application.routes.draw do
  #get 'payments/index'
  #get 'categories/index'
  resources :categories
  resources :payments
  get '/', to: 'reports#index'
  get 'reports/index'
  get 'administration/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
