Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes
  resources :passenger_cars
end
