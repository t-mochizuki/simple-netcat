require './lib/simple_netcat/blank_line'
require './lib/simple_netcat/header'
require './lib/simple_netcat/builder'
require './lib/simple_netcat/request_line'

module SimpleNetcat
  class HeadRequest
    include BlankLine
    include Header
    include Builder
    include RequestLine

    attr_writer :param, :path

    def initialize( param='', path='', port=4567, addr='localhost' )
      @http_method = 'HEAD'
      @param = param
      @path = path
      @port = port
      @addr = addr
      initialize_header do |header|
        header.host = "Host: #{@addr}:#{@port}"
      end
    end

    def dry_run
      %Q( echo "#{build.join('\n')}" | nc -c #{@addr} #{@port} )
    end

    def run
      %x( #{dry_run} )
    end
  end
end
