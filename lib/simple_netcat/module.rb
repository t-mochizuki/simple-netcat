require 'simple_netcat/application'

module SimpleNetcat

  class << self
    def application
      @application ||= SimpleNetcat::Application.new
    end
  end
end
