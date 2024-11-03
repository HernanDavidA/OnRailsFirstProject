Rails.application.routes.draw do
  get "render/index"

  resources :coffee_stations do
    collection do
      post "select", to: "coffee_stations#select"
    end
    member do
      post "create_report", to: "coffee_stations#create_report"
      get "latest_report", to: "coffee_stations#latest_report"
    end
  end

  root "render#index"
end
