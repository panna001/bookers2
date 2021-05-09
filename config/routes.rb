Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about'=> "homes#about", as: "homes_about"
  resources :favorites, only:[:create, :destroy]
  devise_for :users
  resources :users, only:[:show, :index, :edit, :update]
  resources :books, only:[:show, :index, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
