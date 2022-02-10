Gem::Specification.new do |s|
  s.name = 'drb_fileserver'
  s.version = '0.4.0'
  s.summary = 'A DRb server to read or write local files.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/drb_fileserver.rb']
  s.add_runtime_dependency('dir-to-xml', '~> 1.1', '>=1.1.2')
  s.signing_key = '../privatekeys/drb_fileserver.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/drb_fileserver'
end
