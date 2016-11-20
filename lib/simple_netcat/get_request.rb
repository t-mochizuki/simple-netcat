module SimpleNetcat
  class GetRequest
    def initialize( port=4567, addr='localhost' )
      @port = port
      @addr = addr
    end

    def header
      [
        'GET / HTTP/1.1',
        "Host: #{@addr}:#{@port}",
        'Connection: close'
      ]
    end

    def dry_run
      %Q( echo "#{header.join('\n')}" | nc -c #{@addr} #{@port} )
    end

    def run
      %x( #{dry_run} )
    end
  end
end
