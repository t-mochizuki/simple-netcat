require 'test/unit'
require './post_request.rb'

class PostRequestTest < Test::Unit::TestCase
  def setup
    @requrest = PostRequest.new( 'localhost', 4567 )
  end

  def test_dry_run
    dry_run = %Q{ echo "POST /kvs HTTP/1.1\\nHost: localhost:4567\\nContent-Type: application/x-www-form-urlencoded\\nContent-Length: 17\\n\\nkey=foo&value=bar" | nc -c localhost 4567 }
    assert_equal @requrest.dry_run, dry_run
  end
end
