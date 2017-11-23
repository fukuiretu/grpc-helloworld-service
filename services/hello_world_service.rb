require 'grpc'
require 'helloworld_services_pb'
require_relative '../models/user'

class HelloworldService < GprcHellowworld::HelloworldService::Service
  def initialize
    @count = {}
  end

  def hello(parrot_req, _unused_call)
    p parrot_req

    User.create(name: 'hoge')

    GprcHellowworld::HelloworldResponse.new(msg: 'Hello World')
  end
end
