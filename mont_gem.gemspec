Gem::Specification.new do |s|
  s.name          = 'mont_gem'
  s.version       = '0.0.1'
  s.date          = '2016-11-14'
  s.summary       = 'Kele API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Brian Mont']
  s.email         = 'briansmont830@gmail.com'
  s.files         = `git ls-files`.split($/)
  s.require_paths = ["lib"]
  s.homepage      =
   'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'
end