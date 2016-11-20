require 'test/unit'
require './lib/head_request.rb'

class HeadRequestTest < Test::Unit::TestCase
  def setup
    @request = SimpleNetcat::HeadRequest.new
  end

  def test_dry_run
    dry_run = ' echo "HEAD / HTTP/1.1\nHost: localhost:4567\nConnection: close" | nc -c localhost 4567 '
    assert_equal @request.dry_run, dry_run
  end

  def test_run
    assert_match %r(HTTP/1\.1 200 OK), @request.run
  end
end

