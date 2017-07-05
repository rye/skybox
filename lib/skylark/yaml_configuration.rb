require 'yaml'

require 'skylark/configuration'

module Skylark

	class YAMLConfiguration < Configuration

		attr_reader :filename

		def initialize(filename)
			super

			@filename = filename
		end

		def read!
			self.merge!(parse_yaml(read_file(@filename)))
		end

		protected

		def read_file(filename)
			open(filename, 'rb') do |io|
				io.read
			end
		end

		def parse_yaml(data)
			YAML.load(data)
		end

	end

end
