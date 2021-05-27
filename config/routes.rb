Rails.application.routes.draw do

  devise_for :doctors, path: "doctor", controllers: { sessions: "doctor/sessions" }
  devise_for :patients, path: "patient", controllers: { sessions: "patient/sessions" }

  root to: "pages#home"

  namespace :doctor do
    resources :patients, only: [ :index, :show, :new, :create ] do
      resources :consultations, only: [ :create, :new ]
    end
    resources :consultations, only: [ :show, :edit, :update ] do
      resources :consultation_medications, only: [ :new, :create ]
    end
    resources :consultation_medications, only: [ :edit, :destroy , :update ]
    resources :chatrooms, only: [ :show ] do
      resources :messages, only: [:create]
    end
    resources :videorooms, only: [ :show, :update ]
  end

  get '/dashboard', to: "patients#dashboard"
  patch "/activate", to: "patients#activate"
  resources :consultations, only: [ :show ]
  resources :chatrooms, only: [ :show ] do
    resources :messages, only: [:create]
  end
  resources :videorooms, only: [ :show ]

  get '/redirect', to: 'example#redirect', as: 'redirect'
  get '/callback', to: 'example#callback', as: 'callback'
  get '/calendars', to: 'example#calendars', as: 'calendars'

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"

  require "sidekiq/web"
  authenticated :doctor do
    mount Sidekiq::Web => '/sidekiq'
  end
end
