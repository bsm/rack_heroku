class Rack::Heroku::Railtie < Rails::Railtie

  initializer "rack_heroku.middleware" do |app|
    app.config.middleware.insert 0, Rack::Heroku::Profiler
  end

end
