require './lib/simple_netcat/blank_line'
require './lib/simple_netcat/header'
require './lib/simple_netcat/builder'

module SimpleNetcat
  class PutRequest
    include BlankLine
    include Header
    include Builder

    def initialize( body, param='', path='', port=4567, addr='localhost' )
      @body = body
      @param = param
      @path = path
      @port = port
      @addr = addr
      initialize_header do |header|
        header.host = "Host: #{@addr}:#{@port}"
        header.content_length = "Content-Length: #{@body.length}"
      end
    end

    def request_line
      if @param.empty?
        "PUT /#{@path} HTTP/1.1"
      else
        "PUT /#{@path}?#{@param} HTTP/1.1"
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
