Gem::Specification.new do |s|
  s.name = 'humble_rpi-plugin-dhtsensor'
  s.version = '0.1.1'
  s.summary = 'A Humble RPi plugin to read the ambient temperature and humidity from the DHT sensor.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/humble_rpi-plugin-dhtsensor.rb']
  s.add_runtime_dependency('dht-sensor-ffi', '~> 0.1', '>=0.1.4')  
  s.signing_key = '../privatekeys/humble_rpi-plugin-dhtsensor.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/humble_rpi-plugin-dhtsensor'
end
