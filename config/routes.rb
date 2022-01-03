# frozen_string_literal: true

Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to: 'web/oauth2#create', format: 'json'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
