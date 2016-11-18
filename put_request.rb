class PutRequest
  def initialize( body, port=4567, addr='localhost' )
    @body = body
    @port = port
    @addr = addr
  end

  def header
    [
      'PUT /kvs?key=foo HTTP/1.1',
      "Host: #{@addr}:#{@port}",
      "Content-Length: #{@body.length}",
      'Connection: close'
    ]
  end

  def dry_run
    %Q( echo "#{header.push('').push(@body).join('\n')}" | nc -c #{@addr} #{@port} )
  end

  def run
    %x( #{dry_run} )
  end
end

# req = PutRequest.new( 'baz' )
# puts req.run
