Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users

  root 'homes#index'

  get "/toss" => "homes#toss"
  get "/about-us" => "homes#about_us"
  get "/feedback" => "feedbacks#new"

  resources :games, only: [:index, :show]
  resources :transactions, only: [:new, :create]
  resources :posts, only: [:index, :show]

  resource :cart, only: [:show] do
    put 'add/:movie_id', to: 'carts#add', as: :add_to
    put 'remove/:movie_id', to: 'carts#remove', as: :remove_from
  end

  resources :contact_messages, only: [:new, :create]
  get "/contact" => "contact_messages#new"

  resources :feedbacks, only: [:create]

  namespace :admin do
    resources :games, only: [:index, :new, :create, :edit, :update]
    resources :posts, only: [:index, :new, :create, :edit, :update]
    resources :feedbacks, only: [:index]
    get "/" => "dashboards#index"
  end
end
