class Application
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last

      item = @@items.find{|i| i.name == item_name}

      resp.write item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
