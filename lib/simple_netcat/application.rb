module SimpleNetcat

  class Application

    def command( req )
      while true
        puts('Please select command or quit')
        puts('* RUN')
        puts('* DRY-RUN')
        puts('* DISPLAY')
        print 'Netcat> '
        command = gets.strip.downcase

        case command
        when 'run'
          req.run
        when /^dr.?.?.?.?.?$/
          puts req.dry_run
        when /^di.?.?.?.?.?$/
          req.display
        else
          break
        end
      end
    end

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
        when /^g.?.?$/
          req = GetRequest.new
          command( req )
        when /^h.?.?.?$/
          req = HeadRequest.new
          command( req )
        when /^po.?.?$/
          req = PostRequest.new( 'key=foo&value=bar', '', 'kvs' )
          req.content_type = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'
          req.connection = 'Connection: close'
          command( req )
        when /^pu.?$/
          req = PutRequest.new( 'value=baz', '', 'kvs' )
          req.content_type = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'
          req.connection = 'Connection: close'
          command( req )
        when /^d.?.?.?.?.?$/
          req = DeleteRequest.new( '', 'kvs' )
          command( req )
        else
          break
        end
      end
    end
  end
end
