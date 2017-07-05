require 'optparse'

require 'skylark/configuration'

module Skylark

	class ArgumentConfiguration < Configuration
		def self.parse(argv)
			configuration = self.new

			args = OptionParser.new do |parser|
				configuration.define_options(parser)

				parser.parse!(argv)

				if argv.empty?
					puts parser
					$stderr.puts "Expected at least one filename; exiting."
					exit
				end

				configuration[:spec_files] = argv.select do |argument|
					argument_as_filename = File.expand_path(argument, Dir.pwd)
					File.readable?(argument_as_filename)
				end
			end

			configuration
		end

		def initialize
			super

			self[:spec_files] = []
			self[:logger_level] = :warn
		end

		def define_options(parser)
			parser.banner = <<-EOT
Usage: #{$0} [options] [--] <filename> [<filename>...]
EOT
			parser.separator ""
			parser.separator "OPTIONS:"

			add_verbosity_option(parser)

			parser.separator ""
			parser.separator "GENERAL OPTIONS:"

			parser.on_tail('-h', '--help', 'Show this usage message.') do
				puts parser
				exit
			end

			parser.on_tail('--version', 'Print the version.') do
				puts Skytrain::VERSION
				exit
			end
		end

		def add_verbosity_option(parser)
			parser.on('-d', '--debug-level LEVEL', 'Sets the debugging level to LEVEL.') do |level|
				self[:logger_level] = level.downcase.to_sym
			end

			parser.on('-v', '--verbose', 'Sets the debugging level to a sensible verbose default.') do
				self[:logger_level] = :debug
			end
		end
	end

end
