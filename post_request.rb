class PostRequest
  attr_reader :response

  def initialize( addr='localhost', port=8000 )
    @addr = addr
    @port = port
  end

  def header
    [
      'POST /kvs HTTP/1.1',
      "Host: #{@addr}:#{@port}",
      'Content-Type: application/x-www-form-urlencoded',
      "Content-Length: #{body.length}"
    ]
  end

  def body
    'key=foo&value=bar'
  end

  def dry_run
    %Q( echo "#{header.join('\n')}\\n\\n#{body}" | nc -c #{@addr} #{@port} )
  end

  def run
    @response = %x( #{dry_run} )
  end
end
