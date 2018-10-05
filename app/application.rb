class Application
  def call
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)

    else
      resp.write "Route not found"
      resp.status = 400
    end

  end
end
