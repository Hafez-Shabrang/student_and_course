Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "pages#home"
  resources :courses
  get "login", to: "login#new"
  post "login", to: "login#create"
  get "logout", to: "login#destroy"
  resources :students
end
