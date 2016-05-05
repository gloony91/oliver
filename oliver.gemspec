# -*- encoding: utf-8 -*-
require File.expand_path('../lib/oliver/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Josh Trommel']
  gem.email         = 'joshtrommel@gmail.com'
  gem.description   = 'Local Git(Hub) made easy.'
  gem.summary       = 'Manage your Git(Hub) repos/projects easier.'
  gem.homepage      = 'https://github.com/trmml/oliver'
  gem.licenses      = ['MIT']

  gem.files         = `git ls-files`.split($ORS)
  gem.executables   = %w(oliver)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'oliver'
  gem.require_paths = %w(oliver)
  gem.version       = Version::VERSION

  gem.add_development_dependency 'bundler', '~> 1.6'
  gem.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  gem.add_runtime_dependency 'git', '~> 1.3', '>= 1.3.0'
  gem.add_runtime_dependency 'json', '~> 1.8', '>= 1.8.3'
  gem.add_runtime_dependency 'colorize', '~> 0.7.7', '>= 0.7.0'
end
