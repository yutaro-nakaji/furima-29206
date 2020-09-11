Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :items do
    resources :orders
  end
end
