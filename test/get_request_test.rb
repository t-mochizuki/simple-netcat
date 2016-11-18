require 'test/unit'
require './get_request.rb'

class GetRequestTest < Test::Unit::TestCase
  def setup
    @request = GetRequest.new
  end

  def test_dry_run
    dry_run = ' echo "GET / HTTP/1.1\nHost: localhost:4567\nConnection: close" | nc -c localhost 4567 '
    assert_equal @request.dry_run, dry_run
  end
end
