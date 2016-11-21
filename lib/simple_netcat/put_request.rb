require './lib/simple_netcat/blank_line'

module SimpleNetcat
  class PutRequest
    include BlankLine

    def initialize( body, port=4567, addr='localhost' )
      @body = body
      @port = port
      @addr = addr
    end

    def request_line
      'PUT /kvs?key=foo HTTP/1.1'
    end

    def header
      [
        "Host: #{@addr}:#{@port}",
        'Content-Type: application/x-www-form-urlencoded; charset=utf-8',
        "Content-Length: #{@body.length}",
        'Connection: close'
      ]
    end

    def build
      builder = []
      builder << request_line
      header.each { |line| builder << line }
      builder << blank_line
      builder << @body
    end

    def dry_run
      %Q( echo "#{build.join('\n')}" | nc -c #{@addr} #{@port} )
    end

    def run
      %x( #{dry_run} )
    end
  end
end
