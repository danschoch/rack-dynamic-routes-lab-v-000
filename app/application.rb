class Application
  def call
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last

      item = @@items.find{|i| i.name == item_name}
    else
      resp.write "Route not found"
      resp.status = 400
    end

  end
end
