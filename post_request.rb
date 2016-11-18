class PostRequest
  def initialize( body, port=4567, addr='localhost' )
    @body = body
    @port = port
    @addr = addr
  end

  def header
    [
      'POST /kvs HTTP/1.1',
      "Host: #{@addr}:#{@port}",
      'Content-Type: application/x-www-form-urlencoded',
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

# req = PostRequest.new( 'key=foo&value=bar' )
# puts req.run
