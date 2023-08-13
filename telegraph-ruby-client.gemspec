# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'telegraph/version'

Gem::Specification.new do |s|
  s.name = 'telegraph-ruby-client'
  s.version = Telegraph::GEM_VERSION
  s.authors = ['Chuev Oleg']
  s.email = 'chuevov@gmail.com'
  s.platform = Gem::Platform::RUBY
  s.required_rubygems_version = '>= 1.3.6'
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']
  s.homepage = 'https://github.com/OlegChuev/telegraph-ruby-client'
  s.licenses = ['MIT']
  s.summary = 'Telepgraph API client for Ruby.'
  s.add_dependency 'dotenv'
  s.add_dependency 'faraday', '>= 2.7'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-performance'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
