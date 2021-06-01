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

  get '/redirect', to: 'google_api#redirect', as: 'redirect'
  get '/callback', to: 'google_api#callback', as: 'callback'
  get '/calendars', to: 'google_api#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'google_api#events', as: 'events', calendar_id: /[^\/]+/
  post '/events/:calendar_id', to: 'google_api#new_event', as: 'new_event', calendar_id: /[^\/]+/

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"

  require "sidekiq/web"
  authenticated :doctor do
    mount Sidekiq::Web => '/sidekiq'
  end
end
