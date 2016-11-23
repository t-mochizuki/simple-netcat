require 'ostruct'
require './lib/simple_netcat/blank_line'
require './lib/simple_netcat/builder'
require './lib/simple_netcat/request_line'
require './lib/simple_netcat/display'

module SimpleNetcat
  class DeleteRequest
    include BlankLine
    include Builder
    include RequestLine
    include Display

    attr_accessor :header
    attr_writer :param, :path

    def initialize( param='', path='', port=4567, addr='localhost' )
      @http_method = 'DELETE'
      @header = OpenStruct.new( host: "Host: #{addr}:#{port}" )
      @param = param
      @path = path
      @port = port
      @addr = addr
    end

    def dry_run
      %Q( echo "#{build.join('\n')}" | nc -c #{@addr} #{@port} )
    end

    def run
      %x( #{dry_run} )
    end
  end
end
