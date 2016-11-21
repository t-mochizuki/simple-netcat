module SimpleNetcat
  module Header
    attr_writer :host, :connection, :content_type, :content_length

    def initialize_header( &block )
      block.call( self ) if block
    end

    def header
      builder = []
      builder << @host
      builder << @content_type if @content_type
      builder << @content_length if @content_length
      builder << @connection if @connection
      builder
    end
  end
end
