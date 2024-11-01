require_relative "controllers/reports_controller"

class App

  def initialize(app)
    @routes = app.routes
  end

  def call(env)
    req = Rack::Request.new(env)

    clean_path = env["PATH_INFO"].start_with?("/") ? env["PATH_INFO"][1..-1] : env["PATH_INFO"]
    _, id = clean_path.split("/")

    id = id.to_i unless env["PATH_INFO"].end_with?("s")

    if id.class == Integer
      route = @routes[[env["REQUEST_METHOD"], env["PATH_INFO"][0..-2] << ":id"]]
    else
      route = @routes[[env["REQUEST_METHOD"], env["PATH_INFO"]]]
    end


    if route && id.class == Integer
      controller_class = Object.const_get("#{route[:controller].capitalize}Controller")
      action = route[:action]
      controller = controller_class.new
      controller.send(action, req, id)
    elsif route
      controller_class = Object.const_get("#{route[:controller].capitalize}Controller")
      action = route[:action]
      controller = controller_class.new
      controller.send(action, req)
    else
      [404, {"Content-Type" => "application/json"}, {"message" => "Por Not found"}]
    end
  end
end
