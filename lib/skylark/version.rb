module Skylark

	class Version

		attr_reader :major
		attr_reader :minor
		attr_reader :patch
		attr_reader :prerelease

		def initialize(major, minor = 0, patch = 0, prerelease = nil)
			@major, @minor, @patch, @prerelease = major, minor, patch, prerelease
		end

		def to_s(mode = :standard)
			case mode
			when :standard
				"v#{@major}.#{@minor}.#{@patch}#{('-' + @prerelease) if !!@prerelease}"
			when :gemspec
				"#{@major}.#{@minor}.#{@patch}#{('.' + @prerelease) if !!@prerelease}"
			end
		end
	end

	VERSION = Version.new(0, 0, 0)

end
