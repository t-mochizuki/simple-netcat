require 'test/unit'
require './get_request.rb'

class GetRequestTest < Test::Unit::TestCase
  def setup
    @requrest = GetRequest.new( 'localhost', 4567 )
  end

  def test_dry_run
    dry_run = ' echo "GET / HTTP/1.1\nHost: localhost:4567\nConnection: close" | nc -c localhost 4567 '
    assert_equal @requrest.dry_run, dry_run
  end
end
