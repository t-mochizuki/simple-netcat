require 'test/unit'
require './lib/put_request.rb'

class PutRequestTest < Test::Unit::TestCase
  def setup
    @request = SimpleNetcat::PutRequest.new( 'baz' )
  end

  def test_dry_run
    dry_run = %Q{ echo "PUT /kvs?key=foo HTTP/1.1\\nHost: localhost:4567\\nContent-Length: 3\\nConnection: close\\n\\nbaz" | nc -c localhost 4567 }
    assert_equal @request.dry_run, dry_run
  end

  def test_run
    assert_match %r(HTTP/1\.1 200 OK), @request.run
  end
end


