class Application
  def call
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
      item_ = req.path.split("/songs/").last

      song = @@songs.find{|s| s.title == song_title}
    else
      resp.write "Route not found"
      resp.status = 400
    end

  end
end
