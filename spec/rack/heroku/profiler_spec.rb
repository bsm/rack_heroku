require 'spec_helper'

describe Rack::Heroku::Profiler do

  it 'should skip when header not set' do
    get "/"
    last_response.headers["X-Heroku-Queue-Wait"].should be_nil
  end

  it 'should skip when header is invalid' do
    get "/", {}, "HTTP_X_REQUEST_START" => (Time.now.to_f * 1000 + 21).floor
    last_response.headers["X-Heroku-Queue-Wait"].should be_nil
  end

  it 'should calculate queue delay' do
    get "/", {}, "HTTP_X_REQUEST_START" => (Time.now.to_f * 1000 - 21).floor
    last_response.headers["X-Heroku-Queue-Wait"].to_i.should be_within(1).of(21)
  end

end