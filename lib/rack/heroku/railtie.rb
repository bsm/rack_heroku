class Rack::Heroku::Railtie < Rails::Railtie

  initializer "rack_heroku.middleware" do |app|
    app.config.middleware.insert_before ActionDispatch::Static, Rack::Heroku::Profiler
    app.config.middleware.insert_after ActionDispatch::DebugExceptions, Rack::Heroku::Info
  end

end
