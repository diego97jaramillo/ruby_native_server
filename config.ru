require "rack"
require_relative "app/application"
require_relative 'config/database'  # Require the database connection
require_relative 'db/schema'
require_relative "config/routes"

router = Router.new

router.draw do
  get "/reports", to: "reports#index"             # Read all items
  post "/reports", to: "reports#create"           # Create a new item
  get "/reports/:id", to: "reports#show"          # Read a specific item by ID
  patch "/reports/:id", to: "reports#update"        # Update an item by ID
  delete "/reports/:id", to: "reports#destroy"    # Delete an item by ID
end


run App.new(router)
