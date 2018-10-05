class Application
  def call
    req = Rack::Request.new
    resp = Rack::Response.new

    @@items = []

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last

      item = @@items.find{|i| i.name == item_name}

      resp.write item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end

  end
end
