module SimpleNetcat

  class Application

    def initialize
      @get = GetRequest.new
      @head = HeadRequest.new
      @post = PostRequest.new( 'key=foo&value=bar', '', 'kvs' )
      @put = PutRequest.new( 'value=baz', '', 'kvs' )
      @delete = DeleteRequest.new( '', 'kvs' )
    end

    def command( req )
      while true
        puts('Please input a command or quit')
        puts('* RUN')
        puts('* DRY-RUN')
        puts('* DISPLAY')
        puts('* EDIT')
        print 'Netcat> '
        command = gets.strip.downcase

        case command
        when 'run'
          req.run
        when /^dr.?.?.?.?.?$/
          puts req.dry_run
        when /^di.?.?.?.?.?$/
          req.display
        when /^e.?.?.?$/
          while true
            puts 'Please input a HTTP header or quit'
            print 'Netcat> '
            http_header = gets.strip
            if http_header.include?(':')
              tag, value = http_header.split(':', 2)
              eval( %Q( req.header.#{tag.sub( '-', '_' ).downcase} = "#{tag}:#{value}" ) )
            else
              break
            end
          end
        else
          break
        end
      end
    end

    def repl
      while true
        puts('Please input a HTTP method or quit')
        puts('* GET')
        puts('* HEAD')
        puts('* POST')
        puts('* PUT')
        puts('* DELETE')
        print 'Netcat> '
        http_method = gets.strip.downcase

        case http_method
        when /^g.?.?$/
          command( @get )
        when /^h.?.?.?$/
          command( @head )
        when /^po.?.?$/
          @post.header.content_type = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'
          @post.header.connection = 'Connection: close'
          command( @post )
        when /^pu.?$/
          @put.header.content_type = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'
          @put.header.connection = 'Connection: close'
          command( @put )
        when /^d.?.?.?.?.?$/
          command( @delete )
        else
          break
        end
      end
    end
  end
end
