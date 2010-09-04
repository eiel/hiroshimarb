require 'rubygems'
require 'app'
require 'rack/test'
require 'test/unit'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    puts last_response.body
    assert_equal 'Hello World!', last_response.body
  end
end
