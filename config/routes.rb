Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :widgets

  get "manufacturer/:id", to: "manufacturers#show"
end
