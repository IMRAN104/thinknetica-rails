Rails.application.routes.draw do
  
  resources :railway_stations do
    patch :update_position, on: :member
  end

  resources :trains do
    resources :passenger_cars
  end
  resources :routes

  resources :passenger_cars
  resources :first_class_cars, controller: 'passenger_cars', type: 'FirstClassCar'
  resources :sitting_cars, controller: 'passenger_cars', type: 'SittingCar'
  resources :open_sleeping_cars, controller: 'passenger_cars', type: 'OpenSleepingCar'
  resources :sleeping_compartment_cars, controller: 'passenger_cars', type: 'SleepingCompartmentCar'

end
