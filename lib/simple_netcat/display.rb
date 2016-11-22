module SimpleNetcat
  module Display
    def display
      puts request_line
      puts @host if @host
      puts @content_type if @content_type
      puts @content_length if @content_length
      puts @connection if @connection
    end
  end
end
