# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :earthquake_events, only: [:index] do
        resources :comments, only: %i[index create]
      end
    end
  end
end
# earthquake_events/:earthquake_event_id/comments
