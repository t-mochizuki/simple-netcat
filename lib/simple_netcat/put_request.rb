require 'ostruct'
require 'simple_netcat/blank_line'
require 'simple_netcat/builder'
require 'simple_netcat/request_line'
require 'simple_netcat/display'

module SimpleNetcat
  class PutRequest
    include BlankLine
    include Builder
    include RequestLine
    include Display

    attr_accessor :header
    attr_writer :param, :path

    def initialize( body, param='', path='', port=4567, addr='localhost' )
      @http_method = 'PUT'
      @header = OpenStruct.new( host: "Host: #{addr}:#{port}", content_length: "Content-Length: #{body.length}" )
      @body = body
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
