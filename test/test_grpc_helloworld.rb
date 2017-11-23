#!/usr/bin/env ruby
require 'grpc'
require 'helloworld_services_pb'

def test_single_call
  stub = GprcHellowworld::HelloworldService::Stub.new('0.0.0.0:50052', :this_channel_is_insecure)
  req = GprcHellowworld::HelloworldRequest.new(msg: 'Hello World')
  resp_obj = stub.hello(req)

  puts resp_obj
  puts resp_obj.msg
end

test_single_call
