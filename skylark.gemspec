LIB_DIRECTORY = File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift(File.expand_path(LIB_DIRECTORY)) unless $LOAD_PATH.map do |directory|
	File.expand_path(directory)
end.include?(LIB_DIRECTORY)

require 'skylark/version'

Gem::Specification.new do |s|

	s.name = %q[skylark]
	s.version = Skylark::VERSION.to_s :gemspec

	$stderr.puts "Building #{s.name} #{s.version}..."

	s.authors = ['Kristofer Rye']
	s.email = 'kristofer.rye+skylark@gmail.com'
	s.homepage = 'https://github.com/rye/skylark' # TODO gh-pages

	s.summary = 'A CLI-based LDAP scraper whose intended purpose is to dump an entire LDAP search into a bunch of JSON files.'

	s.files = []
	s.files << '.gitignore'
	s.files << '.rspec'
	s.files << 'bin/skylark'
	s.files << Dir.glob('lib/**/*.rb')
	s.files << Dir.glob('spec/**/*.rb')
	s.files << 'skylark.gemspec'
	s.files << 'CONTRIBUTING.md'
	s.files << 'LICENSE.md'
	s.files << 'README.md'

	s.executables = ['skylark']

	s.licenses = ['MIT']

	s.platform = Gem::Platform::RUBY
	s.required_ruby_version = ['>= 2.3.3', '< 3']

	s.add_dependency 'net-ldap', '~> 0.16'

	s.add_development_dependency 'rake', '~> 12'
	s.add_development_dependency 'rspec', '~> 3.6'

	s.add_development_dependency 'codeclimate', '~> 0.65'
	s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'

end
