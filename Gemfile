source "http://rubygems.org"

gem 'rake', '0.8.7' # NOTE: 0.9 breaks Rakefile (bug)

# See: layou2.gemspec
gemspec

group :test do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-test'

  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
end