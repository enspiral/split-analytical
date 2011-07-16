# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "split-analytical/version"

Gem::Specification.new do |s|
  s.name        = "split-analytical"
  s.version     = Split::Analytical::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joshua Vial"]
  s.email       = ["joshua@enspiral.com"]
  s.homepage    = ""
  s.summary     = %q{Send data from split to third parties}
  s.description = %q{Send data from split to third parties using Analytical}

  s.rubyforge_project = "split-analytical"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency(%q<split>, ["~> 0.2.3"]) 
  s.add_dependency(%q<analytical>, ["~>  2.11.0"]) 
  
  s.add_development_dependency 'bundler',     '~> 1.0'
  s.add_development_dependency 'rspec',       '~> 2.6'
  s.add_development_dependency 'guard-rspec', '~> 0.4'
  s.add_development_dependency 'ZenTest'
end
