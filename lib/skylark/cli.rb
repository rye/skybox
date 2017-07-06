require 'fileutils'
require 'base64'
require 'json'

require 'skylark/ldap'
require 'skylark/argument_configuration'
require 'skylark/yaml_configuration'
require 'skylark/version'

module Skylark

	module CLI

		def self.run(args = ARGV)
			argument_configuration = ArgumentConfiguration.parse(args)

			specs = argument_configuration[:spec_files].map do |spec_file|
				spec_configuration = YAMLConfiguration.new(spec_file)
				spec_configuration.read!
				spec_configuration

				if spec_configuration['searches'].is_a? Array
					spec_configuration['searches'].each do |search|
						dump_root_directory = File.join(File.dirname(spec_file), search['dump_directory'])

						auth = {method: :simple, username: spec_configuration['server']['auth']['username'], password: spec_configuration['server']['auth']['password']}
						encryption = {method: :simple_tls, tls_options: {verify_mode: OpenSSL::SSL::VERIFY_NONE}}

						adapter = Skylark::LDAP::Adapter.new(host: spec_configuration['server']['host'], port: spec_configuration['server']['port'].to_i, auth: auth, encryption: encryption)

						adapter.search(base: search['base']) do |entry|
							hash = {}

							entry.each do |entry_key|
								if (attributes = entry[entry_key]).is_a?(Array)
									attributes.map! do |attribute|
										if attribute.encoding == Encoding::ASCII_8BIT
											Base64.strict_encode64(attribute)
										else
											attribute
										end
									end

									attributes = attributes.first if attributes.count <= 1

									hash[entry_key] = attributes
								end
							end

							names = Skylark::LDAP::DN.new(hash[:dn]).names
							domain_name_components = names.reverse.select do |name|
								in_domain_name ||= true && (in_domain_name = name.keys[0].match?(/dc/i))
							end.reverse.to_a

							search_subnames = (names - domain_name_components).reverse
							dump_directory = File.join(dump_root_directory, *search_subnames.select{|name| name.keys.first != 'CN'}.map{|name| name.values.first})

							FileUtils.mkdir_p(dump_directory)

							filename = File.join(dump_directory, "#{entry[:cn].first || ('_OU=' + entry[:ou].first if !entry[:ou].empty?) || ('_' + entry[:dn].first if !entry[:dn].empty?)}.json")

							open(filename, 'wb') do |io|
								io.write JSON.pretty_generate(hash)
								io.write '\n'
							end
						end
					end
				end
			end
		end

	end

end
