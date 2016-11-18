require 'test/unit'
require './delete_request.rb'

class DeleteRequestTest < Test::Unit::TestCase
  def setup
    @requrest = DeleteRequest.new
  end

  def test_dry_run
    dry_run = ' echo "DELETE /kvs HTTP/1.1\nHost: localhost:4567\nConnection: close" | nc -c localhost 4567 '
    assert_equal @requrest.dry_run, dry_run
  end
end
