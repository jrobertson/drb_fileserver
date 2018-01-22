# Introducing the DRb_fileserver and DRb_fileclient gems

## Running the server

To start the fileserver simply run the following:

    require 'drb_fileserver'

    DRbFileServer.new.start

## Reading or writing a file

    require 'drb_fileclient'

    file = DRbFileClient.new

    # reading a file
    s = file.read 'mycoins.txt'

    # writing a file
    file.write 'hello.txt', 'hello world'

Note: To run the drb_fileserver on another machine you will need to specify the named keyword host address e.g. DRbFileServer.new(host: '192.168.4.135').start *where 192.168.4.135 is the IP address of the machine running the fileserver code*. Likewise the client would also need to specify the host address of the fileserver e.g. DRbFileClient.new(host: '192.168.4.135').

## Resources

* drb_fileserver https://rubygems.org/gems/drb_fileserver
* drb_fileclient https://rubygems.org/gems/drb_fileclient

drb_fileserver fileserver fileclient drb drb_fileclient
