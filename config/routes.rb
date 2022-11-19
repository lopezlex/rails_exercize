Rails.application.routes.draw do
 
  root "events#index"

  resources:events do 
    resources :registrations
    resources :likes
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users
  
  get "signup" => "users#new"

  # get 'events' => 'events#index'
  # get 'events/new' => 'events#new'
  # get 'events/:id' => 'events#show',as: "event"
  # get 'events/:id/edit' => 'events#edit', as: "edit_event"
  # patch 'events/:id' => 'events#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
