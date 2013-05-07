# Responds with 204 on :path
class Rack::Heroku::Info
  HEADERS = { "Content-Type" => "text/plain" }.freeze

  def initialize(app, path = "/_heroku/info")
    @app  = app
    @path = path
  end

  def call(env)
    case env["PATH_INFO"]
    when @path
      [200, HEADERS, [""]] # TODO: Return something interesting
    else
      @app.call(env)
    end
  end

end
