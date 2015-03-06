# -*- encoding: utf-8 -*-
require File.expand_path('../lib/oliver/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Josh Trommel']
  gem.email         = ['joshtrommel@gmail.com']
  gem.description   = 'Local Git(Hub) made easy.'
  gem.summary       = 'Manage your Git(Hub) repos/projects easier.'
  gem.homepage      = 'https://github.com/trommel/oliver'

  gem.files         = `git ls-files`.split($ORS)
  gem.executables   = %w(olive oliver)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'oliver'
  gem.require_paths = %w(oliver)
  gem.version       = Oliver::VERSION

  gem.add_development_dependency 'bundler', '~> 1.6'
  gem.add_development_dependency 'rake', '~> 0'
  gem.add_dependency 'git', '~> 1.2.9', '>= 1.2.8'
  gem.add_dependency 'json', '~> 1.8.2', '>= 1.8.0'
end
