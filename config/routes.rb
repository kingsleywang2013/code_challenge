# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'offers#index'
  resources :bids, except: :delete
  resources :offers, except: :delete
end
