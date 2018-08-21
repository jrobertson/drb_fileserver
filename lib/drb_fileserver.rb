#!/usr/bin/env ruby

# file: drb_fileserver.rb

require 'zip'
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
    
    def ls(path)
      path = File.join(path, '*') if File.exists? File.join(@path, path)
      Dir[File.join(@path, path)].map {|x| File.basename(x) }
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
    
    # zips a file. Each array items contains a filename, and content to 
    # be written to the file.
    #
    def zip(filename_zip, a)
      
      Zip::File.open(filename_zip, Zip::File::CREATE) do |x|

        a.each do |filename, buffer| 
          x.get_output_stream(filename) {|os| os.write buffer }
        end

      end         
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
