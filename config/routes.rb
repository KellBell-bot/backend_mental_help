Rails.application.routes.draw do
  resources :appointment_notes
  resources :reviews
  resources :practitioners
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
