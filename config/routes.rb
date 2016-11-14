Rails.application.routes.draw do
  devise_for :users
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :routes
  resources :tickets

  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end

  resources :trains do
    resources :passenger_cars
  end

  resources :passenger_cars
  resources :first_class_cars, controller: 'passenger_cars', type: 'FirstClassCar'
  resources :sitting_cars, controller: 'passenger_cars', type: 'SittingCar'
  resources :open_sleeping_cars, controller: 'passenger_cars', type: 'OpenSleepingCar'
  resources :sleeping_compartment_cars, controller: 'passenger_cars', type: 'SleepingCompartmentCar'

  resource :search, only: [:show, :result] do
    get :result
  end

  root 'searches#show'
end
