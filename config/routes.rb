# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
end
