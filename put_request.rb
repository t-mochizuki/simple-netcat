class PutRequest
  attr_reader :response

  def initialize( addr='localhost', port=8000 )
    @addr = addr
    @port = port
  end

  def header
    [
      'PUT /kvs?key=foo HTTP/1.1',
      "Host: #{@addr}:#{@port}",
      'Content-Length: 3'
    ]
  end

  def body
    'baz'
  end

  def dry_run
    %Q( echo "#{header.join('\n')}\\n\\n#{body}" | nc -c #{@addr} #{@port} )
  end

  def run
    @response = %x( #{dry_run} )
  end
end
