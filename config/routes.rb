Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :lawyers, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  resources :users, only: [] do
    get '/lawyers', to: "lawyers#index_by_user" do
      resources :users, only: [:new, :create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
