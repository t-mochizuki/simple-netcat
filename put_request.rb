class PutRequest
  attr_reader :response

  def header
    [
      'PUT /kvs?key=foo HTTP/1.1',
      'Host: localhost:8000',
      'Content-Length: 3'
    ]
  end

  def body
    'baz'
  end

  def run
    command_line = %Q( echo "#{header.join('\n')}\n#{body}" | nc -c localhost 8000 )
    @response = %x( #{command_line} )
  end
end

put_requrest = PutRequest.new
put_requrest.run
puts put_requrest.response
