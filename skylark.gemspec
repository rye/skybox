LIB_DIRECTORY = File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift(File.expand_path(LIB_DIRECTORY)) unless $LOAD_PATH.map do |directory|
	File.expand_path(directory)
end.include?(LIB_DIRECTORY)

require 'skylark/version'

Gem::Specification.new do |s|

	$stderr.puts "Building #{s.name} version #{s.version}"

	s.name = %q[skylark]
	s.email = 'kristofer.rye+skylark@gmail.com'
	s.homepage = 'https://github.com/rye/skylark' # TODO gh-pages
	s.version = Skylark::VERSION.to_s :gemspec
	s.summary = 'A CLI-based LDAP scraper whose intended purpose is to dump an entire LDAP search into a bunch of JSON files.'
	s.authors = ['Kristofer Rye']
	s.licenses = ['MIT']

end
