module Skybox::LDAP

	class DN
		attr_reader :names

		def initialize(dn_string)
			parse!(dn_string)
		end

		def parse!(dn_string)
			@names = parse(dn_string)
		end

		def parse(dn_string)
			dn_string.scan(/(?<type>OU|CN|DC)=(?<data>[A-z][\w\ -]*),?/i).map do |match|
				{match.first => match.last}
			end
		end
	end

end
