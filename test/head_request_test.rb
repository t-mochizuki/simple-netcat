require 'test/unit'
require './head_request.rb'

class HeadRequestTest < Test::Unit::TestCase
  def setup
    @requrest = HeadRequest.new
  end

  def test_dry_run
    dry_run = ' echo "HEAD / HTTP/1.1\nHost: localhost:4567\nConnection: close" | nc -c localhost 4567 '
    assert_equal @requrest.dry_run, dry_run
  end
end

