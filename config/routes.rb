Rails.application.routes.draw do
  root 'bookings#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/bookings', to: 'bookings#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  match '*path', to: redirect('/'), via: :all
end
