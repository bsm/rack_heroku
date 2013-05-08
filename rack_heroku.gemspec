Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.0'
  s.required_rubygems_version = ">= 1.3.6"

  s.name        = "rack_heroku"
  s.summary     = "Rack middleware for Heroku"
  s.version     = "0.2.0"
  s.license     = "MIT"

  s.authors     = ["Dimitrij Denissenko"]
  s.email       = "dimitrij@blacksquaremedia.com"
  s.homepage    = "https://github.com/bsm/rack_heroku"

  s.require_path = 'lib'
  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")

  s.add_dependency "rack"
  s.add_development_dependency "rake"
  s.add_development_dependency "bundler"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "rspec"
end
