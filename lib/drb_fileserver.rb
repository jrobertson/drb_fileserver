#!/usr/bin/env ruby

# file: drb_fileserver.rb

require 'drb'

class DRbFileServer

  class FileX

    def read(filename)
      File.read filename
    end

    def write(filename, s)
      File.write filename, s
    end

  end

  def initialize(host: 'localhost', port: '61010')

    @host, @port = host, port
    @file = FileX.new

  end

  def start()

    DRb.start_service "druby://#{@host}:#{@port}", @file
    DRb.thread.join

  end
end
