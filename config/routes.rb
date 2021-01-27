Rails.application.routes.draw do

# post "/reviews", to: "reviews#create"

  resources :reviews


  resources :appointment_notes
  resources :practitioners
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
