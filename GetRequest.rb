class GetRequest
  attr_reader :response

  def header
    [
      'GET / HTTP/1.1',
      'Host: localhost:8000'
    ]
  end

  def run
    command_line = %Q( echo "#{header.join('\n')}" | nc -c localhost 8000 )
    @response = %x( #{command_line} )
  end
end

get_requrest = GetRequest.new
get_requrest.run
puts get_requrest.response
