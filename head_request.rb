class HeadRequest
  attr_reader :response

  def header
    [
      'HEAD / HTTP/1.1',
      'Host: localhost:8000'
    ]
  end

  def run
    command_line = %Q( echo "#{header.join('\n')}" | nc -c localhost 8000 )
    @response = %x( #{command_line} )
  end
end

head_requrest = HeadRequest.new
head_requrest.run
puts head_requrest.response
