# frozen_string_literal: true

require_relative 'lib/advent_of_code_2021/version'

Gem::Specification.new do |spec|
  spec.name          = 'advent-of-code-2021'
  spec.version       = AdventOfCode2021::VERSION
  spec.authors       = ['Emily Giurleo']
  spec.email         = ['e.m.giurleo@gmail.com']

  spec.summary       = 'The solutions to Advent of Code 2021'
  spec.description   = 'The solutions to Advent of Code written in Ruby'
  spec.homepage      = 'https://emilygiurleo.dev'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/egiurleo/advent-of-code-2021'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
