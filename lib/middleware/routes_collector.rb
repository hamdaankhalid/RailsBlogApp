class RoutesCollector
  def initialize(app)
    @app = app
  end

  '''
  Based on the incoming request update the routes_hit table
  routes_hit
    current_time, route
  '''
  def call(env)
    request = ActionDispatch::Request.new(env)
    route = request.fullpath
    RouteHit.create!(route: route)
    @app.call(env)
  end
end