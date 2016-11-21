require './lib/simple_netcat/blank_line'
require './lib/simple_netcat/header'

module SimpleNetcat
  class HeadRequest
    include BlankLine
    include Header

    def initialize( port=4567, addr='localhost' )
      @port = port
      @addr = addr
      initialize_header do |header|
        header.host = "Host: #{@addr}:#{@port}"
      end
    end

    def request_line
      'HEAD / HTTP/1.1'
    end

    def build
      builder = []
      builder << request_line
      header.each { |line| builder << line }
      builder << blank_line
      builder << @body if @body
      builder
    end

    def dry_run
      %Q( echo "#{build.join('\n')}" | nc -c #{@addr} #{@port} )
    end

    def run
      %x( #{dry_run} )
    end
  end
end
