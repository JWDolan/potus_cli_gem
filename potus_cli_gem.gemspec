require_relative './lib/presidents/version'
Gem::Specification.new do |s|  #Specification class contains information about the gem
  #Required gemspec attributes
  s.name   = 'presidents'
  s.version  = Presidents::VERSION
  s.summary     = "The Presidents of the United States of America"
  s.authors     = ["James Dolan"]
  s.files       = ["lib/presidents.rb", "lib/presidents/cli.rb", "lib/presidents/scraper.rb", "lib/presidents/restaurant.rb", "config/environment.rb"]

  #Recommended gemspec attributes
  s.email       = 'jwdolan820@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/presidents'

  #Optional gemspec attributes
  s.executables << 'presidents'
  s.description = "Provides information about past Presidents of the United States of America"
  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"

end
