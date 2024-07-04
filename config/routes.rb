Rails.application.routes.draw do
  root 'bookings#index'
  resources :bookings

  get "up" => "rails/health#show", as: :rails_health_check
  
  match '*path', to: redirect('/'), via: :all
end
