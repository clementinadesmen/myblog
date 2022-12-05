Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get "/articles/:id", to: "articles#show"
  resources :articles, only: [:show,:new,:create,:index, :edit, :update, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
