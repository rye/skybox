begin
	require 'rspec/core/rake_task'
	RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task :bootstrap do
	system %(git fetch --tags --unshallow)
end
