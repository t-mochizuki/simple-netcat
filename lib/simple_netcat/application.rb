module SimpleNetcat

  class Application

    def repl
      while true
        puts('Please select HTTP method or quit')
        puts('* GET')
        puts('* HEAD')
        puts('* POST')
        puts('* PUT')
        puts('* DELETE')
        print 'Netcat> '
        http_method = gets.strip.downcase

        case http_method
        when /g.?.?/
          req = GetRequest.new
          req.run
        when /h.?.?.?/
          req = HeadRequest.new
          req.run
        when /po.?.?/
          req = PostRequest.new( 'key=foo&value=bar', '', 'kvs' )
          req.content_type = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'
          req.connection = 'Connection: close'
          req.run
        when /pu.?/
          req = PutRequest.new( 'value=baz', '', 'kvs' )
          req.content_type = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'
          req.connection = 'Connection: close'
          req.run
        when /d.?.?.?.?.?/
          req = DeleteRequest.new( '', 'kvs' )
          req.run
        else
          break
        end
      end
    end
  end
end
