class SimpleNetcat

  def self.repl
    while true
      puts('* adress')
      print 'Netcat> '
      adress = gets.strip

      puts('* port')
      print 'Netcat> '
      port = gets.strip

      puts('* http method')
      print 'Netcat> '
      method = gets.strip

      puts('* cmd')
      print 'Netcat> '
      cmd = gets.strip

      command_line = %Q(echo "#{method} / HTTP/1.1" | nc -c #{adress} #{port})

      break if cmd === 'quit'

      if cmd === 'help'
        puts 'help'
      end

      if cmd === 'run'
        puts %x( #{command_line} )
      end

      if cmd === 'dry'
        puts command_line
      end
    end
  end

end

SimpleNetcat.repl
