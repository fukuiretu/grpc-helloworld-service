#!/usr/bin/env ruby

# require 'rubygems'
require 'grpc'
require 'helloworld_services_pb'

class GprcHellowworldServer
  class << self
    def start
      start_grpc_server
    end

    private

    def start_grpc_server
      puts "grpc server start..."
      
      @server = GRPC::RpcServer.new
      @server.add_http2_port("0.0.0.0:50052", :this_port_is_insecure)
      @server.handle(HelloworldService)
      @server.run_till_terminated
    end
  end
end

class HelloworldService < GprcHellowworld::HelloworldService::Service
  def initialize
    @count = {}
  end

  def hello(parrot_req, _unused_call)
    p parrot_req
    GprcHellowworld::HelloworldResponse.new(msg: 'Hello World')
  end
end

GprcHellowworldServer.start
