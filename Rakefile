require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :bootstrap do
	system %(git fetch --tags --unshallow)
end
