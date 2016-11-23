require 'test/unit'
require './lib/simple_netcat/put_request'

class TestPutRequest < Test::Unit::TestCase
  def setup
    @request = SimpleNetcat::PutRequest.new( 'baz', 'key=foo', 'kvs' )
    @request.header.content_type = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'
    @request.header.connection = 'Connection: close'
  end

  def test_dry_run
    dry_run = ' echo "PUT /kvs?key=foo HTTP/1.1\nHost: localhost:4567\nContent-Length: 3\nContent-Type: application/x-www-form-urlencoded; charset=utf-8\nConnection: close\n\nbaz" | nc -c localhost 4567 '
    assert_equal @request.dry_run, dry_run
  end

  def test_run
    assert_match %r(HTTP/1\.1 200 OK), @request.run
  end
end


