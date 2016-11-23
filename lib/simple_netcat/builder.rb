module SimpleNetcat
  module Builder
    def build
      builder = []
      builder << request_line
      header.each_pair { |k, v| builder << v }
      builder << blank_line
      builder << @body if @body
      builder
    end
  end
end
