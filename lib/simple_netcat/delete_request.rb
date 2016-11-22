require './lib/simple_netcat/blank_line'
require './lib/simple_netcat/header'
require './lib/simple_netcat/builder'

module SimpleNetcat
  class DeleteRequest
    include BlankLine
    include Header
    include Builder

    def initialize( param='', path='', port=4567, addr='localhost' )
      @param = param
      @path = path
      @port = port
      @addr = addr
      initialize_header do |header|
        header.host = "Host: #{@addr}:#{@port}"
      end
    end

    def request_line
      if @param.empty?
      "DELETE /#{@path} HTTP/1.1"
      else
      "DELETE /#{@path}?#{@param} HTTP/1.1"
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
