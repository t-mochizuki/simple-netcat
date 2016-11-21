module SimpleNetcat
  module Builder
    def build
      builder = []
      builder << request_line
      header.each { |line| builder << line }
      builder << blank_line
      builder << @body if @body
      builder
    end
  end
end
