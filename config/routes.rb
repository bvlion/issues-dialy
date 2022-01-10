# frozen_string_literal: true

Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to: 'api/oauth2#create', format: 'json'
  patch '/admin/site', to: 'api/site#site', format: 'json'
  patch '/admin/article', to: 'api/site#article', format: 'json'
end
