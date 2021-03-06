require 'test/unit'
require 'simple_netcat/delete_request'

class TestDeleteRequest < Test::Unit::TestCase
  def setup
    @request = SimpleNetcat::DeleteRequest.new( '', 'kvs' )
    @request.header.connection = 'Connection: Keep-Alive'
  end

  def test_dry_run
    dry_run = ' echo "DELETE /kvs HTTP/1.1\nHost: localhost:4567\nConnection: Keep-Alive\n" | nc -c localhost 4567 '
    assert_equal @request.dry_run, dry_run
  end

  def test_run
    assert_match %r(HTTP/1\.1 200 OK), @request.run
  end
end
