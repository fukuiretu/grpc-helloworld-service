#!/usr/bin/env ruby
require 'grpc'
require_relative '../services/hello_world_service'

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

GprcHellowworldServer.start
