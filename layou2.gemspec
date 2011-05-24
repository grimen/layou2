# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "layou2/version"

Gem::Specification.new do |s|
  s.name        = "layou2"
  s.version     = Layou2::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jonas Grimfelt"]
  s.email       = ["grimen@gmail.com"]
  s.homepage    = "http://github.com/grimen/#{s.name}"
  s.summary     = %{The layout helpers.}
  s.description = s.summary

  s.add_dependency 'activesupport', '~> 2.3.11'
  s.add_dependency 'actionpack', '~> 2.3.11'

  s.add_development_dependency 'test-unit', '1.2.3'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'webrat'
  s.add_development_dependency 'rails', '~> 2.3.11'
  s.add_development_dependency 'sqlite3-ruby'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
