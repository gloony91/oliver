# -*- encoding: utf-8 -*-
require File.expand_path('../lib/oliver/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Josh']
  gem.email         = ['joshception@icloud.com']
  gem.description   = %q{Local Git(Hub) made easy.}
  gem.summary       = %q{Manage your Git(Hub) easier.}
  gem.homepage      = 'https://github.com/trommel/oliver'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = ['olive', 'oliver']
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'oliver'
  gem.require_paths = ['oliver']
  gem.version       = Oliver::VERSION

  gem.add_development_dependency "bundler", "~> 1.6"
  gem.add_development_dependency "rake"
  gem.add_dependency 'rainbow', '>= 2.0.0'
end
