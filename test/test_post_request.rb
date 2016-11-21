require 'test/unit'
require './lib/simple_netcat/post_request'

class TestPostRequest < Test::Unit::TestCase
  def setup
    @request = SimpleNetcat::PostRequest.new( 'key=foo&value=bar' )
  end

  def test_dry_run
    dry_run = ' echo "POST /kvs HTTP/1.1\nHost: localhost:4567\nContent-Type: application/x-www-form-urlencoded\nContent-Length: 17\nConnection: close\n\nkey=foo&value=bar" | nc -c localhost 4567 '
    assert_equal @request.dry_run, dry_run
  end

  def test_run
    assert_match %r(HTTP/1\.1 200 OK), @request.run
  end
end

