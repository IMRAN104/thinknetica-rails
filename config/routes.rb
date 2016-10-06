Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes

  resources :passenger_cars
  resources :first_class_cars, controller: 'passenger_cars', type: 'FirstClassCar'
  resources :sitting_cars, controller: 'passenger_cars', type: 'SittingCar'
  resources :open_sleeping_cars, controller: 'passenger_cars', type: 'OpenSleepingCar'
  resources :sleeping_compartment_cars, controller: 'passenger_cars', type: 'SleepingCompartmentCar'
end
