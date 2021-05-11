Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about'=> "homes#about", as: "homes_about"
  get 'search/search', as: "search"
  devise_for :users
  resources :users, only:[:show, :index, :edit, :update] do
    resource :relationships, only:[:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :books, only:[:show, :index, :create, :edit, :update, :destroy] do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
