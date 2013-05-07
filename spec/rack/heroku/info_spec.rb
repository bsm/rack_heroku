require 'spec_helper'

describe Rack::Heroku::Info do

  it 'should ignore non-matching paths' do
    get "/"
    last_response.body.should == "OK"

    get "/other"
    last_response.body.should == "OK"
  end

  it 'should return info' do
    get "/_heroku/info"
    last_response.status.should == 200
    last_response.body.should == ""
  end

end