# Rails
#   .application
#   .routes
#   .draw do
#     resources :registrations

#     root 'movies#index'
#     # get "movies" => "movies#index"
#     # # get "movies/1" => "movies#show"
#     # # by naming it as movie , we can now see a path helper

#     # get "movies/new" => "movies#new"
#     # get "movies/:id" => "movies#show", as: "movie"
#     # get "movies/:id/edit" => "movies#edit", as: "edit_movie"
#     # patch "movies/:id" => "movies#update"
#     # # get "movies/new" => "movies#new", as: "new_movie" # we need to take this above "show" to avoid the error

#     # To define all the routes at once
#     resources :movies
#     # patch "movies/:id" => "movies#destroy", as: "delete_movie"

#   # Version 2 API routes for MoviesController within the Api::V2 namespace
#   namespace :api do
#     namespace :v2 do
#       resources :movies
#     end
#   end

#   # Version 3 API routes for MoviesController within the Api::V3 namespace
#   namespace :api do
#     namespace :v3 do
#       resources :movies
#     end
#   end

#   end

Rails
  .application
  .routes
  .draw do
    resources :users
    resource  :categories

    get "movies/filter/:filter" => "movies#index", as: :filter  

    # resources :sessions, only: [:new, :create, :destroy] # since we don't need all the paths
    # we specify only the paths we need

    # Since the route related to destroy requires and ID parameter, since we will not be storing sessions in a database. We won’t be looking them up by an ID. Because a user will only have one session, we use a singular form of the resource in our routes
    resource :session, only: %i[new create destroy]
    # delete "session" => "sessions#destroy", as: "sign_out"


    # WE NEED TO NEST LIKES INSIDE MOVIES TO LINK IT UP
    # resource :likes, only: %i[new create destroy]


    root 'movies#index'

    # The routes file is setting up a hierarchical routing structure for movies and their associated registrations, following RESTful conventions, making the URLs semantic and meaningful.
    # For example, URLs like /movies/1/registrations will map to the index action of the RegistrationsController to show all registrations for the movie with ID 1.
    resources :movies do
      resources :registrations
      resource :likes, only: %i[new create destroy]
    end

    resources :users
    get 'signup' => 'users#new'
  end
