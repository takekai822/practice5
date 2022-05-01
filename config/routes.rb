Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => "homes#about"

  resources :books, except: [:new] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, except: [:new, :destroy]
  get 'searches' => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
