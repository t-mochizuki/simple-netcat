module SimpleNetcat
  module Display
    def display
      puts request_line
      header.each_pair { |k, v| puts v }
    end
  end
end
