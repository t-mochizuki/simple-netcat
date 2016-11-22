module SimpleNetcat
  module RequestLine
    def request_line
      if @param.empty?
        "#{@http_method} /#{@path} HTTP/1.1"
      else
        "#{@http_method} /#{@path}?#{@param} HTTP/1.1"
      end
    end
  end
end
