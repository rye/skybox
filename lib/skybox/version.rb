module Skybox

	class Version

		attr_reader :major
		attr_reader :minor
		attr_reader :patch
		attr_reader :prerelease

		def initialize(major, minor = 0, patch = 0, prerelease = nil)
			@major, @minor, @patch, @prerelease = major, minor, patch, prerelease
		end

		def to_s
			"v#{@major}.#{@minor}.#{@patch}#{('-' + @prerelease) if !!@prerelease}"
		end
	end

	if git_describe = `git describe --tags --dirty 2>/dev/null`.chomp && !!git_describe
		VERSION = Version.new(0, 0, 0, "alpha-#{git_describe}")
	else
		VERSION = Version.new(0, 0, 0, 'alpha')
	end

end
