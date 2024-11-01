class Router

  attr_reader :routes

  def initialize
     @routes = {}
  end

  def draw(&block)
    instance_eval(&block)
  end

  def get(path, to:)
    controller_name, action = to.split("#")
    add_route("GET", path, controller_name, action)
  end

  def post(path, to:)
    controller_name, action = to.split("#")
    add_route("POST", path, controller_name, action)
  end

  def patch(path, to:)
    controller_name, action = to.split("#")
    add_route("PATCH", path, controller_name, action)
  end

  def delete(path, to:)
    controller_name, action = to.split("#")
    add_route("DELETE", path, controller_name, action)
  end

  def add_route(http_method, path, controller_name, action)
    @routes[[http_method, path]] = {controller: controller_name, action: action}
  end


end
