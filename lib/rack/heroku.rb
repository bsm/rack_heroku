require 'rack'

module Rack::Heroku
end

%w|profiler|.each do |name|
  require "rack/heroku/#{name}"
end

require 'rack/heroku/railtie' if defined?(Rails)
