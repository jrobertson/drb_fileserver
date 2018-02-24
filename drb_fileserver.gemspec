Gem::Specification.new do |s|
  s.name = 'drb_fileserver'
  s.version = '0.1.2'
  s.summary = 'A DRb server to read or write local files.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/drb_fileserver.rb']
  s.signing_key = '../privatekeys/drb_fileserver.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/drb_fileserver'
end
