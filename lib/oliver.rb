require_relative 'oliver/version'
require 'commander/import'

program :name, 'oliver'
program :version, Oliver::Version::STRING
program :description, 'Manage your Git(Hub) repos/projects easier.'

command :init do |c|
  c.syntax = 'olive init'
  c.description = 'initializes the main directory by creating a base dotfile'
end

command :install do |c|
  c.syntax = 'olive install'
  c.description = 'clones/removes repos if they\'re listed'
end

command :list do |c|
  c.syntax = 'olive list'
  c.description = 'list user repos'
end

command :pull do |c|
  c.syntax = 'olive pull'
  c.description = 'pull updates from each tracked repo'
end
