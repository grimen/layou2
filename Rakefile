# encoding: utf-8
require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require File.join(File.dirname(__FILE__), 'lib', 'layou2', 'version')

# Gem managment tasks.
#
# == Generate gemspec, build & install locally:
#
#   rake gemspec
#   rake build
#   sudo rake install
#
# == Git tag & push to origin/master and push gem to Rubygems.org:
#
#   rake release
#
# == Release to Rubygems.org:
#
#   rake gemcutter:release
#
begin
  gem 'jeweler'
  require 'jeweler'

  Jeweler::Tasks.new do |spec|
    spec.name         = "layou2"
    spec.version      = ::Layou2::VERSION
    spec.summary      = %{The layout helpers.}
    spec.description  = spec.summary
    spec.homepage     = "http://github.com/grimen/#{spec.name}"
    spec.authors      = ["Jonas Grimfelt"]
    spec.email        = "grimen@gmail.com"

    spec.files = FileList["[A-Z]*", File.join(*%w[{generators,lib,rails} ** *]).to_s]

    spec.add_dependency 'activesupport', '>= 2.3.0'
    spec.add_dependency 'actionpack', '>= 2.3.0'

    spec.add_development_dependency 'test-unit', '= 1.2.3'
    spec.add_development_dependency 'mocha', '>= 0.9.8'
    spec.add_development_dependency 'webrat', '>= 0.7.0'
    spec.add_development_dependency 'leftright', '>= 0.0.3'
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler - or one of its dependencies - is not available. " <<
  "Install it with: sudo gem install jeweler -s http://gemcutter.org"
end

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the plugin.'
Rake::TestTask.new(:test) do |test|
  test.libs = ['lib', 'test']
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

desc 'Generate documentation for the plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = ''
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('rails/init.rb')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
