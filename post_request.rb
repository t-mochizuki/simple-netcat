class PostRequest
  attr_reader :response

  def initialize( addr='localhost', port=4567 )
    @addr = addr
    @port = port
  end

  def header
    [
      'POST /kvs HTTP/1.1',
      "Host: #{@addr}:#{@port}",
      'Content-Type: application/x-www-form-urlencoded',
      "Content-Length: 17",
      'Connection: close'
    ]
  end

  def body
    'key=foo&value=bar'
  end

  def dry_run
    %Q( echo "#{header.push('').push(body).join('\n')}" | nc -c #{@addr} #{@port} )
  end

  def run
    @response = %x( #{dry_run} )
  end
end

req = PostRequest.new
puts req.run
