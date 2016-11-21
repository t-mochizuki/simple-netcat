require './lib/simple_netcat/blank_line'
require './lib/simple_netcat/header'
require './lib/simple_netcat/builder'

module SimpleNetcat
  class DeleteRequest
    include BlankLine
    include Header
    include Builder

    def initialize( port=4567, addr='localhost' )
      @port = port
      @addr = addr
      initialize_header do |header|
        header.host = "Host: #{@addr}:#{@port}"
      end
    end

    def request_line
      'DELETE /kvs HTTP/1.1'
    end

    def dry_run
      %Q( echo "#{build.join('\n')}" | nc -c #{@addr} #{@port} )
    end

    def run
      %x( #{dry_run} )
    end
  end
end
