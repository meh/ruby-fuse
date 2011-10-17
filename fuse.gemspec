Gem::Specification.new {|s|
	s.name         = 'fuse'
	s.version      = '0.0.1'
	s.author       = 'meh.'
	s.email        = 'meh@paranoici.org'
	s.homepage     = 'http://github.com/meh/ruby-fuse'
	s.platform     = Gem::Platform::RUBY
	s.summary      = 'Bindings and wrapper for FUSE'

	s.files         = `git ls-files`.split("\n")
	s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
	s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
	s.require_paths = ['lib']

	s.add_dependency 'ffi'
	s.add_dependency 'ffi-extra'
}
