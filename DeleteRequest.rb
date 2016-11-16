class DeleteRequest
  attr_reader :response

  def header
    [
      'DELETE /kvs HTTP/1.1',
      'Host: localhost:8000'
    ]
  end

  def run
    command_line = %Q( echo "#{header.join('\n')}" | nc -c localhost 8000 )
    @response = %x( #{command_line} )
  end
end

delete_requrest = DeleteRequest.new
delete_requrest.run
puts delete_requrest.response
