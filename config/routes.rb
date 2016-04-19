Rails.application.routes.draw do
  root 'hussars#index'

  resources :hussars
  resources :horses

  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine => '/api-ui'
end
