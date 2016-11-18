class PutRequest
  attr_reader :response

  def initialize( addr='localhost', port=4567 )
    @addr = addr
    @port = port
  end

  def header
    [
      'PUT /kvs?key=foo HTTP/1.1',
      "Host: #{@addr}:#{@port}",
      "Content-Length: #{body.length}",
      'Connection: close'
    ]
  end

  def body
    'baz'
  end

  def dry_run
    %Q( echo "#{header.push('').push(body).join('\n')}" | nc -c #{@addr} #{@port} )
  end

  def run
    @response = %x( #{dry_run} )
  end
end

req = PutRequest.new
puts req.run
