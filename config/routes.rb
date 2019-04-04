# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bids, except: :delete
  resources :offers, except: :delete
end
