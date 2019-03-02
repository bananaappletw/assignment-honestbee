begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
rescue LoadError # rubocop:disable Lint/HandleExceptions
end
