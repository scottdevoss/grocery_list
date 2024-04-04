Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/grocery_list", to: "grocery#index"
  post "/grocery_list", to: "grocery#create"
  delete "/grocery_list/:id", to: "grocery#destroy"
  get "/update/:id", to: "grocery#edit"
  patch "/update/:id", to: "grocery#update"
end
