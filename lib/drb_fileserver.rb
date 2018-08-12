#!/usr/bin/env ruby

# file: drb_fileserver.rb

require 'drb'
require 'fileutils'


class DRbFileServer

  class FileX

    def initialize(path='.')
      
      @path = path
      
    end
    
    def cp(path, path2)
      puts 'cp: ' + [File.join(@path, path), File.join(@path, path2)].inspect
      FileUtils.cp File.join(@path, path), File.join(@path, path2)
    end        
    
    def exists?(filename)
      File.exists? File.join(@path, filename)
    end
    
    def mkdir(name)
      FileUtils.mkdir File.join(@path, name)
    end
    
    def mkdir_p(path)
      FileUtils.mkdir_p File.join(@path, path)
    end
    
    def mv(path, path2)
      FileUtils.mv File.join(@path, path), File.join(@path, path2)
    end    
    
    def read(filename)
      File.read File.join(@path, filename)
    end
    
    def rm(filename)
      FileUtils.rm File.join(@path, filename)
    end     
    
    def stop()
      puts 'stopping DFS service ...'
      DRb.stop_service
      'connection closed'
    end

    def write(filename, s)
      File.write File.join(@path, filename), s
    end

  end

  def initialize(host: 'localhost', port: '61010', path: '.')

    @host, @port = host, port
    @file = FileX.new path

  end

  def start()

    DRb.start_service "druby://#{@host}:#{@port}", @file
    DRb.thread.join

  end
end
