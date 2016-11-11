Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  resources :users, only: :show
  namespace :admin do
    root "static_pages#index", as: "root"
    resources :subjects
  end
end
