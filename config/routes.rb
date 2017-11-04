# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'

  resources :items
  resources :categories
  resources :fio_items, except: [:edit, :update, :show]
  resources :tokens
end
