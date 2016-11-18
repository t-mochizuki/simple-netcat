class DeleteRequest
  attr_reader :response

  def initialize( addr='localhost', port=4567 )
    @addr = addr
    @port = port
  end

  def header
    [
      'DELETE /kvs HTTP/1.1',
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

req = DeleteRequest.new
puts req.run
