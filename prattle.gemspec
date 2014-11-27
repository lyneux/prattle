$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "prattle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "prattle"
  s.version     = Prattle::VERSION
  s.authors     = ["Guy Molyneux"]
  s.homepage    = "https://github.com/lyneux/prattle"
  s.summary     = "Rails forum engine"
  s.description = "A no-nonsense rails forum engine"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.0.3'
  s.add_dependency 'will_paginate-bootstrap', '~> 1.0.1'
  s.add_dependency 'sanitize', '2.0.6'
  s.add_dependency 'bb-ruby'

  s.add_development_dependency "sqlite3"
end
