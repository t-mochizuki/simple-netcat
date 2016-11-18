require 'test/unit'
require './put_request.rb'

class PutRequestTest < Test::Unit::TestCase
  def setup
    @requrest = PutRequest.new( 'baz' )
  end

  def test_dry_run
    dry_run = %Q{ echo "PUT /kvs?key=foo HTTP/1.1\\nHost: localhost:4567\\nContent-Length: 3\\nConnection: close\\n\\nbaz" | nc -c localhost 4567 }
    assert_equal @requrest.dry_run, dry_run
  end
end


