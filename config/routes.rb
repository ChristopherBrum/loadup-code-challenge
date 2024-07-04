Rails.application.routes.draw do
  root 'bookings#new'
  resources :bookings, only: [:index, :show, :new, :create, :destroy]
  get "up" => "rails/health#show", as: :rails_health_check
  match '*path', to: redirect('/'), via: :all
end
