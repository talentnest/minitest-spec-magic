# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.8.7'
  s.required_rubygems_version = ">= 1.6.0"

  s.name        = "minitest-spec-magic"
  s.summary     = "Minitest::Spec extensions for Rails and beyond"
  s.description = "Combines Minitest::Spec with shoulda-like goodies"
  s.version     = "0.1.0"

  s.authors     = ["Dimitrij Denissenko", "Ken Collins", "thoughtbot, inc."]
  s.email       = "dimitrij@blacksquaremedia.com"
  s.homepage    = "https://github.com/bsm/minitest-spec-magic"

  s.require_path = 'lib'
  s.files        = Dir['lib/**/*']

  s.add_dependency "minitest", "~> 2.6.0"

  s.add_development_dependency "rake"
  s.add_development_dependency "bundler"
end
