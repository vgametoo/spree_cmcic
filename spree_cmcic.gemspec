Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'spree_cmcic'
  s.version = '2.0.0'
  s.summary = 'Add gem summary here'
  s.description = 'Spree commerce extension for CM-CIC payment'
  s.required_ruby_version = '>= 1.9.3'

  s.author = 'Vincent Charlet'
  s.email = ''

  s.files = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

end