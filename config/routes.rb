Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :widgets, only: [ :show, :index ]

  # avoiding custom actions:
  # resources :widgets, only: [ :show ] do 
  #   post "update_rating"
  # end
  resources :widget_ratings, only: [ :create ]


  get "manufacturer/:id", to: "manufacturers#show"


  ####
  # Custom (vanity) routes start here 
  #
  # For each new custom route: 
  #
  # * Be sure you have the canonical route declared above
  # * Add the new custom route below the existing ones
  # * Document why it's needed
  # * Explain anything else non-standard

  # Used in podcast ads for the 'amazing' campaign
  get "/amazing", to: redirect("/widgets")
  # get "/amazing", to: "widgets#index" # without redirecting

end
