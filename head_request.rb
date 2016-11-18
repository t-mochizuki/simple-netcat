class HeadRequest
  attr_reader :response

  def initialize( port=4567, addr='localhost' )
    @port = port
    @addr = addr
  end

  def header
    [
      'HEAD / HTTP/1.1',
      "Host: #{@addr}:#{@port}",
      'Connection: close'
    ]
  end

  def dry_run
    %Q( echo "#{header.join('\n')}" | nc -c #{@addr} #{@port} )
  end

  def run
    @response = %x( #{dry_run} )
  end
end

req = HeadRequest.new
puts req.run
