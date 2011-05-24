
guard 'bundler' do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  # watch(/^.+\.gemspec/)
end

guard 'test' do
  watch(%r{lib/(.*)\.rb})      { |m| "test/#{m[1]}_test.rb" }
  watch(%r{test/integration/rails_app/(.*)\.rb})
  watch(%r{test/.*_test\.rb})
  watch('test/test_helper.rb') { "test" }
end
