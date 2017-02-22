Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :lawyers, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  mount Attachinary::Engine => '/attachinary'
  resources :users, only: [] do
    get '/lawyers', to: "lawyers#index_by_user"
    get '/profile', to: "pages#profile"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
