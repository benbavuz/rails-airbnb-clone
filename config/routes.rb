Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get '/about', to: "pages#about"

  resources :lawyers, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  mount Attachinary::Engine => '/attachinary'
  resources :users, only: [] do
    get '/lawyers', to: "lawyers#index_by_user"
    get '/profile', to: "pages#profile"
    get '/appointments', to: "pages#appointments"
  end
end

