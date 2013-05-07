require 'rspec'
require 'rack/test'
require 'rack/heroku'

module Rack::Heroku::TestMethods

  def inner_app
    @inner_app ||= ->env { [200, {'Content-Type' => 'text/plain'}, ['OK']] }
  end

  def app
    described_class.new inner_app
  end

end

RSpec.configure do |c|
  c.include Rack::Test::Methods
  c.include Rack::Heroku::TestMethods
end
