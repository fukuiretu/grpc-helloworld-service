require 'grpc'
require 'helloworld_services_pb'

class HelloworldService < GprcHellowworld::HelloworldService::Service
  def initialize
    @count = {}
  end

  def hello(parrot_req, _unused_call)
    p parrot_req
    GprcHellowworld::HelloworldResponse.new(msg: 'Hello World')
  end
end
