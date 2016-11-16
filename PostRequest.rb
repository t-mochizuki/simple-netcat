class PostRequest
  attr_reader :response

  def header
    [
      'POST /kvs HTTP/1.1',
      'Host: localhost:8000',
      'Content-Type: application/x-www-form-urlencoded',
      'Content-Length: 17'
    ]
  end

  def body
    'key=foo&value=bar'
  end

  def run
    command_line = %Q( echo "#{header.join('\n')}\n#{body}" | nc -c localhost 8000 )
    @response = %x( #{command_line} )
  end
end

post_requrest = PostRequest.new
post_requrest.run
puts post_requrest.response
