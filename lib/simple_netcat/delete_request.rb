module SimpleNetcat
  class DeleteRequest
    def initialize( port=4567, addr='localhost' )
      @port = port
      @addr = addr
    end

    def request_line
      'DELETE /kvs HTTP/1.1'
    end

    def header
      [
        "Host: #{@addr}:#{@port}",
        'Connection: Keep-Alive'
      ]
    end

    def blank_line
      ''
    end

    def build
      builder = []
      builder << request_line
      header.each { |line| builder << line }
      builder << blank_line
    end

    def dry_run
      %Q( echo "#{build.join('\n')}" | nc -c #{@addr} #{@port} )
    end

    def run
      %x( #{dry_run} )
    end
  end
end
